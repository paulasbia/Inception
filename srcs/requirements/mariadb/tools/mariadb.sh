#!/bin/bash

service mariadb start;

mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

mariadb -e "CREATE USER IF NOT EXISTS ${SQL_USER}@localhost IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mariadb -e "FLUSH PRIVILEGES;"

echo "Stopping MariaDB..."
sleep 2
su root service mariadb stop

echo "Starting MariaDB in safe mode..."
exec mysqld_safe --bind-address=0.0.0.0