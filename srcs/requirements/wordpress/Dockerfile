FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y wget php php-fpm php-mysql mariadb-client

#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN wget https://wordpress.org/wordpress-6.6.1.tar.gz -P /var/www 

RUN cd /var/www && tar -xzvf wordpress-6.6.1.tar.gz && rm wordpress-6.6.1.tar.gz

#make sure that we give root permission to write to this folder.
RUN chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create a directory for PHP runtime files to enable PHP to start correctly
RUN mkdir /run/php

COPY ./tools/wordpress.sh .
RUN chmod +x wordpress.sh

WORKDIR /var/www/html/

ENTRYPOINT /wordpress.sh