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
	
	echo "WordPress download"
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wordpress
	
	echo "WordPress configuration"
	sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
    echo "Installing WordPress:"
	wp core install --allow-root --url=${DOMAIN_NAME} --title="Inception" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}
	echo "Creating a USER:"
    wp user create --allow-root ${WP_USR} ${WP_EMAIL} --user_pass=${WP_PASS};
fi

exec "$@"