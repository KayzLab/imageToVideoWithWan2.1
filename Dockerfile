FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y git ffmpeg libsm6 libxext6 python3-pip curl wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the WAN2.1 repository
RUN git clone https://github.com/Wan-Video/Wan2.1.git && \
    cd Wan2.1 && \
    pip install -r requirements.txt

COPY entrypoint.sh /app/entrypoint.sh
COPY app.py /app/app.py

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
