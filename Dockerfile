# Usa uma imagem Debian básica
FROM debian:latest

# Atualiza pacotes e instala dependências
RUN apt update && apt install -y \
    git \
    build-essential \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

# Clona o repositório do Cronus TXT
RUN git clone https://github.com/cronus-emulator/cronus-txt.git /cronus

# Define diretório de trabalho
WORKDIR /cronus

# Compila o servidor
RUN make clean && make server

# Expõe a porta padrão do Cronus TXT
EXPOSE 6900

# Comando para iniciar o servidor
CMD ["./athena-start"]
