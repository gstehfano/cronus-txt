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
# Defina o fuso horário para a sua região
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata
