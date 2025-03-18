FROM nginx:alpine

# Copia os arquivos do jogo para a pasta padrão do Nginx
COPY . /usr/share/nginx/html

EXPOSE 80

# Comando para rodar o servidor
CMD ["nginx", "-g", "daemon off;"]
