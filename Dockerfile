# Usando uma imagem base do Debian
FROM debian:bullseye-slim

# Defina as variáveis de ambiente para evitar interação
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libboost-all-dev \
    libssl-dev \
    tzdata \
    && echo "America/Sao_Paulo" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*

# Clone o repositório do Cronus TXT
RUN git clone https://github.com/cronus-emulator/cronus-txt.git /cronus

# Defina o diretório de trabalho
WORKDIR /cronus

# Exponha as portas necessárias para char e map
EXPOSE 6121 5121 80
