# Etapa 1: Compilar o binário da aplicação
FROM golang:1.20-alpine AS builder

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o código da aplicação para o contêiner
COPY main.go .

# Compilar o binário da aplicação
RUN go build -o hello-world-app main.go

# Etapa 2: Criar a imagem de produção
FROM alpine:latest

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o binário da aplicação da fase de build para a fase de produção
COPY --from=builder /app/hello-world-app .

# Expor a porta 8080
EXPOSE 8080

# Comando de inicialização do contêiner
CMD ["./hello-world-app"]
