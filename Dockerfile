FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-runtime
RUN apt update -y
RUN apt install -y git

WORKDIR /app
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git ComfyUI/custom_nodes/ComfyUI-Manager

WORKDIR /app/ComfyUI
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "main.py", "--listen=0.0.0.0"]
