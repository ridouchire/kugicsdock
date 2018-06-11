goto:
	docker exec -it kugicsdock_php_1 bash

build:
	docker-compose build

up:
	docker-compose up -d

logs:
	docker-compose logs

halt:
	docker-compose down
