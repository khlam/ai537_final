FROM nvidia/cuda:11.3.0-base-ubuntu20.04 as base
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /app
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html && \
    pip3 install numpy 
COPY ./requirements.txt /app/requirements.txt
RUN apt-get update && apt-get install -y python3-opencv
RUN pip install -r requirements.txt