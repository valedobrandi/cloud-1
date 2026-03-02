#!/bin/bash

export MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD WORDPRESS_DB_HOST WORDPRESS_DB_USER WORDPRESS_DB_PASSWORD

cd /var/www/html

until nc -z "$WORDPRESS_DB_HOST" 3306; do
    sleep 3
done

if [ ! -f /var/www/html/wp-config.php ]; then
        wp config create \
                --dbname="$MYSQL_DATABASE" \
                --dbuser="$WORDPRESS_DB_USER" \
                --dbpass="$MYSQL_PASSWORD" \
                --dbhost="$WORDPRESS_DB_HOST" \
                --allow-root \
		--path=/var/www/html
fi

if ! wp core is-installed --allow-root --path=/var/www/html; then
	wp core install \
		--url="https://bde-albu.42.fr" \
		--title="inception site" \
		--admin_user="$WORDPRESS_DB_USER" \
		--admin_password="$WORDPRESS_DB_PASSWORD" \
		--admin_email="bde-albu@42.fr" \
		--skip-email \
		--allow-root \
		--path=/var/www/html

	
	wp user create regularuser guest@42.fr \
		--user_pass="$WORDPRESS_DB_PASSWORD" \
		--role=subscriber \
		--allow-root \
		--path=/var/www/html

fi

exec php-fpm7.4 -F
