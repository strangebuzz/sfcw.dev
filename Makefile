## —— 🧙 Sfsx.dev 🧙 ———————————————————————————————————————————————————————————
.DEFAULT_GOAL := help

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Yarn /dev 🐱 —————————————————————————————————————————————————————————————
install: ## Project setup
	yarn install

serve: ## Compiles and hot-reloads for development
	yarn serve

## —— Tests ✅ —————————————————————————————————————————————————————————————————
test: tests ## Run the testcafe tests suite
	yarn test

## —— Coding standards ✨ ——————————————————————————————————————————————————————
lint: ## Lints and fixes files
	yarn lint

## —— Deploy & Prod 🚀 —————————————————————————————————————————————————————————
build: install ## Clean-up the old dist folder, compiles and minifies for production
	rm -rf dist/*
	yarn build
	git checkout dist/.gitkeep

le-renew: ## Renew Let's encrypt HTTPS cerificates
	certbot --apache -d sfcw.dev
