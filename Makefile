
all: up

up:
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down --remove-orphans 

clean: down
	docker system prune --volumes -f

destroy:
	sudo rm -r /home/pde-souz/data/mariadb_volume/* && sudo rm -r /home/pde-souz/data/wordpress_volume/*

re: down up

.PHONY: all up clean re
