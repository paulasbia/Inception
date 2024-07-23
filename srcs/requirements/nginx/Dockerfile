FROM debian:buster

RUN apt update && \
    apt install -y nginx openssl && \
    apt install vim -y && \
    apt install curl -y 

#COPY

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out \
    /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key \
    -subj "/C=PT/ST=IDF/L=Lisboa/O=42/OU=42/CN=pde-souz.42.fr/UID=pde-souz"

#EXPOSE 443

#ENTRYPOINT [ "executable" ]