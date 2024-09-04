# Usar a imagem oficial do PHP
FROM php:8.1-apache

# Definir variáveis de ambiente
#API GCP IA 
ENV API_URL = ""

# Copiar o script PHP para o diretório padrão do Apache
COPY upload.php index.html /var/www/html/

# Expor a porta 80 para o Apache
EXPOSE 80
