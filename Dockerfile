# Usando uma imagem base do Ubuntu
FROM ubuntu:20.04

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libboost-all-dev \
    libssl-dev \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Defina as variáveis de ambiente para evitar interação
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# Atualiza o fuso horário para São Paulo (Brasil)
RUN echo "America/Sao_Paulo" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

# Clone o repositório do Cronus TXT
RUN git clone https://github.com/cronus-emulator/cronus-txt.git /cronus

# Defina o diretório de trabalho
WORKDIR /cronus

# Exponha as portas necessárias para o servidor
EXPOSE 5121 6121

# Comando para rodar o Cronus TXT (ajuste conforme necessário)
CMD ["./cronus-txt"]
