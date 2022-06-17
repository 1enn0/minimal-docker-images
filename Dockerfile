FROM python:3.10.5-slim

# Install system packages
RUN apt update; \
    apt install -y --no-install-recommends \
          ffmpeg \
          git \
          openssh-client

# Setup workspace dirs
RUN mkdir -p /workspace/notebooks
WORKDIR /workspace

# Upgrade pip just in case
RUN python -m pip install --upgrade pip

# Copy & install requirements.txt from host, then remove from image
ADD requirements.txt .
RUN python -m pip install -r requirements.txt && rm ./requirements.txt

# Clone private repo
# RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# RUN --mount=type=ssh git clone git@github.com:USER/REPO.git

EXPOSE 8888

CMD ["jupyter", "lab", "--no-browser", "--notebook-dir=/workspace/notebooks", "--allow-root", "--ip=0.0.0.0", "--port=8888"] 
