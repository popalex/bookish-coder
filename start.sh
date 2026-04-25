#!/bin/bash

echo "Starting Ollama..."
OLLAMA_HOST=0.0.0.0 ollama serve &

# Wait for Ollama to be ready
sleep 5

echo "Pulling models (first run only)..."
ollama pull qwen2.5-coder:7b
ollama pull qwen2.5-coder:14b

echo "Starting LiteLLM proxy..."

litellm --config /config.yaml \
        --host 0.0.0.0 \
        --port 4000 &

echo "All services started."

wait