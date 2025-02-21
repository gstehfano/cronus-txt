# Usa uma imagem base do Debian
FROM debian:latest

# Atualiza pacotes e instala dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

# Define uma variável de ambiente para o token do GitHub (será injetada pelo Koyeb)
ARG GITHUB_TOKEN

# Configura a URL do repositório com o token de autenticação
RUN git config --global url."https://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@github.com/".insteadOf "https://github.com/"

# Clona o repositório do Cronus TXT
RUN git clone https://github.com/cronus-emulator/cronus-txt.git /cronus

# Define o diretório de trabalho
WORKDIR /cronus

# Compila o servidor Cronus
RUN make clean && make server

# Expõe a porta usada pelo servidor (6900 é padrão)
EXPOSE 6900

# Comando para rodar o servidor Cronus
CMD ["./athena-start"]
