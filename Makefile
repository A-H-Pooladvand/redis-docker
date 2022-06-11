#!/bin/bash

## ------------------------------
## Author: Amirhossein Pooladvand
## ------------------------------

include .env
export

.PHONY: help composer

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Builds the docker-compose.yml file
	docker compose build --remove-orphans

rebuild: ## Rebuilds docker-compose.yml
	docker compose up --build --force-recreate --remove-orphans

up: ## Create and start containers
	docker compose up --remove-orphans

watch: ## Create, start and detach containers
	docker compose up -d --remove-orphans

down: ## Stop and remove resources
	docker compose down

ps: ## List project containers
	@docker compose ps -f name=redis

login: ## Login into a specific container
	docker exec -it redis sh;