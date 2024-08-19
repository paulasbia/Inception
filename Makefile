
all: up

up: setup
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down --remove-orphans 

clean: down
	# docker builder prune
	docker system prune -f -a --volumes

re: down up

.PHONY: all up setup clean re