PACKAGES ?= example-lib example-app

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: format
format: ## format codes
	cargo fmt --all

.PHONY: format-all
format-all: ## format packages
	@for pkg in $(PACKAGES); do \
		cd $$pkg && make -f ../Makefile format && cd -; \
	done

.PHONY: format-check
format-check: ## check code format
	cargo fmt --all -- --check --verbose

.PHONY: lint
lint: ## lint codes
	cargo clippy -- -D warnings --verbose

.PHONY: test
test: ## run tests
	cargo test --release --all-features --verbose

.PHONY: build
build: ## build an app
	cargo build --verbose

.PHONY: run
run: ## run an app
	cargo run --verbose

.PHONY: ci-test-base
ci-test-base: format-check lint test build ## ci test base

.PHONY: ci-test
ci-test: ## ci test
	@for pkg in $(PACKAGES); do \
		cd $$pkg && make -f ../Makefile ci-test-base && cd -; \
	done
