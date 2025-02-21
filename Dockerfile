# Usa uma imagem Debian básica
FROM debian:latest

# Atualiza pacotes e instala dependências necessárias
RUN apt update && apt install -y \
    git \
    build-essential \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

# Clona o repositório do Cronus TXT usando o token de autenticação
RUN git clone https://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@github.com/cronus-emulator/cronus-txt.git /cronus

# Define o diretório de trabalho
WORKDIR /cronus

# Compila o servidor
RUN make clean && make server

# Expõe a porta usada pelo servidor
EXPOSE 6900

# Comando para rodar o servidor
CMD ["./athena-start"]
