FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y wget php php-fpm php-mysql mariadb-client

#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN wget https://wordpress.org/wordpress-6.6.1.tar.gz -P /var/www 

RUN cd /var/www && tar -xzvf wordpress-6.6.1.tar.gz && rm wordpress-6.6.1.tar.gz
#make sure that we give root permission to write to this folder.
RUN chown -R root:root /var/www/wordpress

#COPY ./conf/www.conf /etc/php/8.1/