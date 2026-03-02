.PHONY: build up down

build:
	docker compose --env-file secrets/.env -f srcs/docker-compose.yml build
up:
	docker compose --env-file secrets/.env -f srcs/docker-compose.yml up -d
down:
	docker compose -f srcs/docker-compose.yml down

