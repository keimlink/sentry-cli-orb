.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[\.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

orb.yml: $(shell find src -name '*.yml') ## Pack up the orb into a single file
	circleci config pack src > orb.yml

.PHONY: validate
validate: orb.yml ## Validate the orb
	circleci orb validate orb.yml

.PHONY: yamllint
yamllint: ## Lint YAML files
	docker run -it --rm -v $$(pwd):/src/ singapore/lint-condo:latest yamllint .
