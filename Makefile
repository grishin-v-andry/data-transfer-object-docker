help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Создание и запуск контейнеров
	docker-compose -f docker-compose.yml up -d

down: ## Остановка и удаление контейнеров
	docker-compose -f docker-compose.yml down

ps: ## Список запущенных контейнеров
	docker-compose -f docker-compose.yml ps --all

exec-php: ## Войти в контейнер php
	docker exec -it php_dto /bin/bash

build: ## Собрать контейнеры
	docker-compose -f docker-compose.yml build --no-cache