# Use official PyTorch CUDA image
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

RUN echo "Updating apt repositories and installing system packages..." && \
    apt-get update -y && \
    apt-get install -y git ffmpeg libsm6 libxext6 python3-pip curl wget --no-install-recommends && \
    echo "System packages installed."

RUN echo "Upgrading pip and installing Python dependencies..." && \
    pip install --upgrade pip && \
    pip install torch torchvision torchaudio fastapi uvicorn transformers numpy opencv-python && \
    echo "Python dependencies installed."

RUN echo "Cloning WAN2.1 repo..." && \
    git clone https://github.com/deepseek-ai/wan2.1.git /app/wan2.1 && \
    echo "Repository cloned."

WORKDIR /app/wan2.1

COPY app.py /app/wan2.1/app.py

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
