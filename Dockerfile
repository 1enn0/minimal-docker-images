FROM python:3.10.5-slim

# Setup and activate virtual environment
# ENV VIRTUAL_ENV "/venv"
# RUN python -m venv $VIRTUAL_ENV
# ENV PATH "$VIRTUAL_ENV/bin:$PATH"

# Upgrade pip just in case
RUN python -m pip install --upgrade pip

# Install ffmpeg (for librosa)
RUN apt update && apt install -y ffmpeg

# Setup workspace dirs
RUN mkdir -p /workspace/notebooks
WORKDIR /workspace

# Copy & install requirements.txt from host, then remove from image
ADD requirements.txt .
RUN python -m pip install -r requirements.txt && rm ./requirements.txt

# Set jupyterlab as entrypoint
EXPOSE 8888
ENTRYPOINT ["jupyter", "lab"]
CMD ["--no-browser", "--notebook-dir=/workspace/notebooks", "--allow-root", "--ip=0.0.0.0", "--port=8888"] 
