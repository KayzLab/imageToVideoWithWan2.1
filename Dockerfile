# Use official PyTorch CUDA image
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git ffmpeg libsm6 libxext6 python3-pip curl wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip
RUN pip install torch torchvision torchaudio fastapi uvicorn transformers numpy opencv-python

# Clone WAN2.1 repo (replace with official repo if you have URL)
RUN git clone https://github.com/deepseek-ai/wan2.1.git /app/wan2.1

WORKDIR /app/wan2.1

# Copy the API server file into container
COPY app.py /app/wan2.1/app.py

# Expose port 8000
EXPOSE 8000

# Run the API server
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
