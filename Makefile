composer:
	docker-compose up -d composer
key-generate:
	docker-compose up -d php-cli-key-generate
migrate:
	docker-compose up -d php-cli-migrate
up:
	docker compose up web php-fpm db
stop:
	docker-compose stop
