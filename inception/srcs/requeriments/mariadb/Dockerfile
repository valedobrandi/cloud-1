FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y mariadb-server && \
	sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY conf/generate_init.sh /generate_init.sh

COPY conf/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

