.PHONE: up upd down build ps restart

all: build upd

build:
	docker compose -f docker-compose.base.yaml -f docker-compose.apps.yaml build

up:
	docker compose -f docker-compose.base.yaml -f docker-compose.apps.yaml up

upd:
	docker compose -f docker-compose.base.yaml -f docker-compose.apps.yaml up -d

down:
	docker compose -f docker-compose.base.yaml -f docker-compose.apps.yaml down

ps:
	docker compose -f docker-compose.base.yaml -f docker-compose.apps.yaml ps

restart:
	docker compose -f docker-compose.base.yaml -f docker-compose.apps.yaml restart
