FROM debian:buster

RUN apt-get update &&\
    apt-get install -y \
    mariadb-server

COPY conf/mysqld.conf /etc/mysql/mariadb.conf.d/mysqld.conf

COPY tools/mariadb.sh /root/mariadb.sh