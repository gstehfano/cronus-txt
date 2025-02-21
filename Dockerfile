# Usando uma imagem base do Ubuntu
FROM ubuntu:20.04

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

# Clone o repositório do Cronus TXT usando token pessoal (substitua <seu_token> pelo token gerado)
RUN git clone https://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@github.com/cronus-emulator/cronus-txt.git /cronus

# Defina o diretório de trabalho
WORKDIR /cronus

# Exponha as portas necessárias para char e map
EXPOSE 6121 5121 8000

# Comando para rodar o Cronus TXT (ajuste conforme necessário)
CMD ["./cronus-txt"]
