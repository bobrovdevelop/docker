composer:
	docker compose up -d composer
key-generate:
	docker compose up -d php-cli-key-generate
migrate:
	docker compose up -d php-cli-migrate
up:
	docker compose up -d web php-fpm db
stop:
env:
	cp ./backend/.env.example ./backend/.env