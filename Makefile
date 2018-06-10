goto:
	docker exec -it docker_latest_php_1 bash

build:
	docker-compose build

up:
	docker-compose up -d

logs:
	docker-compose logs

halt:
	docker-compose down
