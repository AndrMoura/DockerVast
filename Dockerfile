FROM nvidia/cuda:12.0.1-devel-ubuntu20.04

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV TRANSFORMERS_CACHE=/app/cache


WORKDIR /app

COPY requirements.txt  .

RUN apt-get update && \
    apt-get install -y --no-install-recommends git-lfs && \
    apt-get install python3-pip -y && \
    git lfs install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt


RUN git clone https://huggingface.co/deepseek-ai/deepseek-coder-33b-instruct && rm -rf deepseek-coder-33b-instruct/.git

COPY . .
