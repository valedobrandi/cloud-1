#!/bin/bash

export WORDPRESS_DB_HOST WORDPRESS_DB_USER WORDPRESS_DB_PASSWORD

cd /var/www/html

echo "Waiting for database to be ready..."
until nc -z "$WORDPRESS_DB_HOST" 3306; do
    sleep 3
done

echo "Waiting for WordPress files..."
until [ -f /var/www/html/wp-config.php ]; do
    sleep 2
done

wp config set FORCE_SSL_ADMIN true --raw --allow-root

wp core install \
    --url="https://cloud1.stoicsoftwares.net" \
    --title="inception site" \
    --admin_user="$WORDPRESS_DB_USER" \
    --admin_password="$WORDPRESS_DB_PASSWORD" \
    --admin_email="bde-albu@42.fr" \
    --skip-email \
    --allow-root 