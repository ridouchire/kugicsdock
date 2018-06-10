goto:
	docker exec -it docker_latest_php_1 bash

up:
	docker-compose up -d

logs:
	docker-compose logs

halt:
	docker-compose down
