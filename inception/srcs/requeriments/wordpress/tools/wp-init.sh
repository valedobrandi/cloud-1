#!/bin/bash

export MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD WORDPRESS_DB_HOST WORDPRESS_DB_USER WORDPRESS_DB_PASSWORD

cd /var/www/html

echo "Waiting for database to be ready..."
until nc -z "$WORDPRESS_DB_HOST" 3306; do
    sleep 3
done

wp core install \
    --url="https://bde-albu.42.fr" \
    --title="inception site" \
    --admin_user="$WORDPRESS_DB_USER" \
    --admin_password="$WORDPRESS_DB_PASSWORD" \
    --admin_email="bde-albu@42.fr" \
    --skip-email \
    --allow-root 