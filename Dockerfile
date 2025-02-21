# Usa uma imagem base do Debian
FROM debian:latest

# Atualiza pacotes e instala dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

# Clona o repositório do Cronus TXT usando o token diretamente na URL
RUN git clone https://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@github.com/cronus-emulator/cronus-txt.git /cronus

# Define o diretório de trabalho
WORKDIR /cronus

