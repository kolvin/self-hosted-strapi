help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Setup commit hooks and install deps
	@pre-commit install
	@cd app; npm install

build: ## Build src
	@cd app; npm run build

run: ## Run dev project
	@cd app; npm run dev

preview: ## Preview complied site 
	@make -s build
	@cd app; npm run start

expose-preview: ## Expose preview site publiclly via ngrok
	@ngrok http 3000
