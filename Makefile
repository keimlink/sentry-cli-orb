.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[\.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: process
process: ## Resolve the orb and it's dependencies
	@circleci orb process src/orb.yml

.PHONY: validate
validate: ## Validate the orb
	circleci orb validate src/orb.yml

.PHONY: yamllint
yamllint: ## Lint YAML files
	docker run -it --rm -v $$(pwd):/src/ singapore/lint-condo:latest yamllint .
