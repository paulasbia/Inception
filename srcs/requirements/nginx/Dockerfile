FROM debian:bullseye

RUN apt update && \
    apt install -y nginx openssl && \
    apt install vim -y && \
    apt install curl -y 

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

RUN mkdir -p /etc/nginx/ssl
WORKDIR /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/pde-souz.crt \
    -keyout /etc/nginx/ssl/pde-souz.key \
    -subj "/C=PT/L=Lisboa/O=42/OU=student/CN=pde-souz.42.fr"

RUN mkdir -p /var/run/nginx

RUN chmod -R 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

#ENTRYPOINT [ "executable" ]