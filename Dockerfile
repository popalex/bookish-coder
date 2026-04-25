FROM nvidia/cuda:12.1.1-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install LiteLLM
RUN pip install litellm

# Set model storage
ENV OLLAMA_MODELS=/root/.ollama

# Expose ports
EXPOSE 11434
EXPOSE 4000

# Copy files
COPY start.sh /start.sh
COPY config.yaml /config.yaml

RUN chmod +x /start.sh

CMD ["/start.sh"]