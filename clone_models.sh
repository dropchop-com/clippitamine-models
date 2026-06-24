#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
staging_area="${script_dir}/.staging-area"
target_dir="${script_dir}"

clone_and_sync() {
  local repo="$1"
  local model="$2"

  if [ ! -d "${staging_area}/${model}" ]; then
    echo "git clone ${repo}/${model} ${staging_area}/${model}"
    git clone "${repo}/${model}" "${staging_area}/${model}"
  fi

  local rsync_args=(
    --include="${model}"
    --include="*/*.json"
    --include="*/*.model"
    --include="*/*.safetensors"
    --include="*/*.md"
    --include="*/*.bin"
    --include="*/*16*.gguf"
    --include="*/*.pt"
    --include="*/1_Pooling"
    --exclude="*"
  )

  echo "rsync -uva ${rsync_args[*]} ${staging_area}/${model} ${target_dir}"
  rsync -uva "${rsync_args[@]}" "${staging_area}/${model}" "${target_dir}"

  (
    cd "${target_dir}/${model}"
    find . -maxdepth 1 -type f ! -name 'checksum.sha256' -print0 \
      | sort -z \
      | xargs -0 sha256sum > checksum.sha256
  )
}

mkdir -p "${staging_area}"
mkdir -p "${target_dir}"

clone_and_sync "https://huggingface.co/gpustack" "bge-m3-GGUF"
clone_and_sync "https://huggingface.co/limcheekin" "snowflake-arctic-embed-l-v2.0-GGUF"
clone_and_sync "https://huggingface.co/Snowflake" "snowflake-arctic-embed-l-v2.0"
clone_and_sync "https://huggingface.co/BAAI" "bge-m3"

#rm -Rf ${staging_area}
