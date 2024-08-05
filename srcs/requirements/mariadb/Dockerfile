FROM debian:bullseye

RUN apt-get update &&\
    apt-get install -y \
    mariadb-server

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY conf/mysqld.conf /etc/mysql/mariadb.conf.d/mysqld.conf

COPY tools/mariadb.sh .

RUN chmod +x mariadb.sh

# EXPOSE 3306

# # Define the script to be run when the container starts
ENTRYPOINT ./mariadb.sh