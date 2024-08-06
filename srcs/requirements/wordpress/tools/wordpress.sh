#!/bin/sh

#https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# sudo mv wp-cli.phar /usr/local/bin/wp


# WordPress installation
if [ -f ./wp-config.php ]
then
	echo "WordPress already downloaded!"
else
	touch /var/log/fpm-php.www.log && chmod 666 /var/log/fpm-php.www.log

	echo "WordPress download"
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	
	mv /wordpress/* .
	rm -rf ../wordpress
	cp wp-config-sample.php wp-config.php

	echo "WordPress configuration"
	sed -i "s/username_here/$DB_USER/g" wp-config.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
	sed -i "s/database_name_here/$DB_HOSTNAME/g" wp-config.php
	sed -i "s/localhost/$DB_HOSTNAME/g" wp-config.php
    echo "Installing WordPress:"
	wp core install --allow-root --url=${DOMAIN_NAME} --title="Inception" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}
	echo "Creating a USER:"
    wp user create --allow-root ${WP_USR} ${WP_EMAIL} --user_pass=${WP_PASS};
fi

/usr/sbin/php-fpm7.4 -F
exec "$@"