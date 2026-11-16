COMPOSE := $(shell command -v docker compose > /dev/null 2>&1 && echo "docker compose" || echo "docker-compose")
PYTHON := $(shell command -v python > /dev/null 2>&1 && echo "python" || echo "python3")

.PHONY: deploy
deploy: ## start all services
	$(COMPOSE) up -d

.PHONY: logs
logs: ## see and follow logs from all running services
	$(COMPOSE) logs -f

.PHONY: down
down: ## stop and remove services
	$(COMPOSE) down

.PHONY: dev
dev: ## run services in development mode
	$(COMPOSE) -f ./dev.compose.yaml up --build

.PHONY: dev-down
dev-down: ## stop and remove development services
	$(COMPOSE) -f ./dev.compose.yaml down

.PHONY: help
help: ## show make commands
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[1m%-20s\033[0m %s\n", $$1, $$2}'

