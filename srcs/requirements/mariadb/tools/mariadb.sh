#!/bin/bash

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]; 
then
	echo "Database already exists"
else
    service mariadb start;

    mariadb -uroot --host=localhost -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

    mariadb -uroot --host=localhost -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

    mariadb -uroot --host=localhost -e "GRANT ALL PRIVILEGES ON '$SQL_DATABASE'.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

    mariadb -uroot --host=localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

    mariadb -uroot --host=localhost -e "FLUSH PRIVILEGES;"

    echo "Stopping MariaDB..."
    sleep 2
    su root service mariadb stop
fi

echo "Starting MariaDB in safe mode:"
exec mysqld_safe --socket=/run/mysqld/mysqld.sock --bind-address=0.0.0.0