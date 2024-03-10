FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.10 \
    python3.10-dev \
    python3.10-venv \
    python3-pip \
    git \
    curl \
    libbz2-dev \
    libncurses5-dev \
    libffi-dev \
    libreadline-dev \
    libssl-dev \
    apt-utils \
    build-essential

# 仮想環境を作成し、アクティベート
RUN python3.10 -m venv /venv
ENV PATH=/venv/bin:$PATH

# 必要なPythonライブラリをインストール
RUN pip install --upgrade pip && \
    pip install torch==2.1.1 \
                transformers==4.35.2 \
                accelerate==0.23.0 \
                peft==0.7.1 \
                trl==0.7.4

# 作業ディレクトリを設定
WORKDIR /workspace