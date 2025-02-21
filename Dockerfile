mey dyck file atual # Usando uma imagem base do Ubuntu
FROM ubuntu:20.04

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libboost-all-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone o repositório do Cronus TXT
RUN git clone https://github.com/cronus-emulator/cronus-txt.git /cronus

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

# Adicione outras instruções aqui conforme necessário

# Exemplo: Copiar o código fonte para o container
# COPY . /app

# Definir o diretório de trabalho
# WORKDIR /app

# Exemplo de comando para rodar o aplicativo
# CMD ["python", "app.py"]
# Exponha as portas necessárias
EXPOSE 5121 8000
