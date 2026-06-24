---
license: apache-2.0
base_model:
- Snowflake/snowflake-arctic-embed-l-v2.0
tags:
- gguf
- embeddings
- f16
---

# Model Card: Snowflake Arctic Embed L v2.0 (GGUF Quantized)

## Model Overview

This model is a GGUF-quantized version of [Snowflake's Arctic Embed L v2.0](https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0), a state-of-the-art multilingual text embedding model designed for high-quality retrieval tasks. The quantization reduces the model's size and computational requirements, facilitating efficient deployment without significantly compromising performance.

## Model Details

- **Model Name:** snowflake-arctic-embed-l-v2.0-GGUF
- **Original Model:** [Snowflake's Arctic Embed L v2.0](https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0)
- **Quantization Format:** GGUF
- **Parameters:** 568 million
- **Embedding Dimension:** 1,024
- **Languages Supported:** Multilingual (supports multiple languages)
- **Context Length:** Supports up to 8,192 tokens
- **License:** Apache 2.0

## Quantization Details

GGUF (Gerganov's General Unified Format) is a binary format optimized for efficient loading and inference of large language models. Quantization involves reducing the precision of the model's weights, resulting in decreased memory usage and faster computation with minimal impact on accuracy. 

## Performance

The original Arctic Embed L v2.0 model achieves state-of-the-art performance on various retrieval benchmarks, including the MTEB Retrieval benchmark, with an NDCG@10 score of 55.98. The GGUF-quantized version aims to maintain this high performance while offering enhanced efficiency. 

## Usage

This quantized model is suitable for deployment in resource-constrained environments where memory and computational efficiency are critical. It can be utilized for tasks such as information retrieval, semantic search, and other applications requiring high-quality text embeddings.

## Limitations

While quantization reduces resource requirements, it may introduce slight degradation in model performance. Users should evaluate the model in their specific use cases to ensure it meets the desired performance criteria.

## Acknowledgements

This quantized model is based on Snowflake's Arctic Embed L v2.0. For more details on the original model, please refer to the [official model card](https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0).

---

For a visual overview of Snowflake's Arctic Embed v2.0, you may find the following video informative:
https://www.youtube.com/watch?v=CmSZZkzghhU