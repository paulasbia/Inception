#!/bin/bash

#https://bertvv.github.io/cheat-sheets/Bash.html
set -euo pipefail

if [ -d "/var/lib/mysql/$DB_DATABASE" ]; 
then
	echo "Database already exists"
else
    service mariadb start;

    mariadb -uroot --host=localhost -e "CREATE DATABASE IF NOT EXISTS $DB_DATABASE;"

    mariadb -uroot --host=localhost -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"

    mariadb -uroot --host=localhost -e "GRANT ALL PRIVILEGES ON '$DB_DATABASE'.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"

    mariadb -uroot --host=localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"

    mariadb -uroot --host=localhost -e "FLUSH PRIVILEGES;"

    echo "Stopping MariaDB..."
    sleep 2
    su root service mariadb stop
fi

echo "Starting MariaDB in safe mode:"
exec mysqld_safe --socket=/run/mysqld/mysqld.sock --bind-address=0.0.0.0