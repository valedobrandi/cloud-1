FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y php7.4-fpm php-mysql curl unzip netcat && \
	mkdir -p /var/www/html && \
	curl -O https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
	cp -r wordpress/* /var/www/html/ && \
	rm -rf wordpress && \
	rm latest.tar.gz && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html

COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY tools/wp-init.sh /usr/local/bin/wp-init.sh

RUN chmod +x /usr/local/bin/wp-init.sh

EXPOSE 9000

WORKDIR /var/www/html

