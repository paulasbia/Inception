FROM debian:buster

RUN apt-get -y install wget && \
    apt-get install -y php\
    php-fpm\
    php-mysql\
    mariadb-client

#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN wget https://wordpress.org/latest.tar.gz -P /var/www 

RUN cd /var/www && tar -xzvf latest.tar.gz && rm latest.tar.gz
#make sure that we give root permission to write to this folder.
RUN chown -R root:root /var/www/wordpress

