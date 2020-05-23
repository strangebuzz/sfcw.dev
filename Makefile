## —— 🧙 Sfcw.dev 🧙 ———————————————————————————————————————————————————————————
.DEFAULT_GOAL := help

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Deploy & Prod 🚀 —————————————————————————————————————————————————————————
le-renew: ## Renew Let's encrypt HTTPS cerificates
	certbot --apache -d sfcw.dev
