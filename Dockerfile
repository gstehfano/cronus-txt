# Usando uma imagem base do Ubuntu
FROM ubuntu:20.04

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libboost-all-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Configurando o GitHub token a partir da variável de ambiente
ARG GITHUB_TOKEN
RUN git clone https://$GITHUB_TOKEN@github.com/cronus-emulator/cronus-txt.git /cronus

# Defina o diretório de trabalho
WORKDIR /cronus

# Exponha a porta necessária (ajuste se necessário)
EXPOSE 5121

# Comando para rodar o Cronus TXT (ajuste conforme necessário)
CMD ["./cronus-txt"]

# Expondo as portas necessárias para char e map
EXPOSE 6121
EXPOSE 5121

# Base image (exemplo, use a imagem que você precisa)
FROM debian:bullseye-slim

# Defina as variáveis de ambiente para evitar interação
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# Atualiza os pacotes e instala o tzdata
RUN apt-get update && apt-get install -y tzdata \
    && echo "America/Sao_Paulo" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata
