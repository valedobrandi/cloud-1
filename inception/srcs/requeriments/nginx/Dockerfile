FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY certs/ssl-cert.pem /etc/ssl/certs/
COPY certs/ssl-cert.key /etc/ssl/private/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

