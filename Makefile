.DEFAULT_GOAL := help

# Включаем .env
-include .env

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## Build containers
	docker-compose build
	@echo -e "Make: Up containers.\n"

up: ## Up containers
	@docker-compose up -d --remove-orphans
	@echo -e "Make: Up containers.\n"

down: ## Down containers
	@docker-compose down

stop: ## Stop contrainers
	@docker-compose stop

php-bash:
	docker exec -it --user www-data $(PHP_CONTAINER) bash

composer-install:
	docker exec -it $(PHP_CONTAINER) sh -c "composer install"

migrate-up:
	docker exec -it $(PHP_CONTAINER) sh -c "php artisan migrate"
