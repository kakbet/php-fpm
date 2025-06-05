REPOSITORY ?= development
TAG ?= latest
VERSION ?= 8.3
APPVERSION ?= 0.0.7
PRODVERSION ?= prod-0.0.5


build:
	docker build --progress=plain --network=host \
		-t $(REPOSITORY)/php-fpm:$(TAG) \
		-f $(VERSION)-fpm/Dockerfile .
.PHONY: build


build-prod-push-fpm-83-alpine:
	@echo "Building PHP 8.3 Docker images (linux/amd64,linux/arm64)..."
	@docker buildx build --push -t registry.wodoxo.com/sportsbook/php-fpm-8.3-alpine:$(PRODVERSION) --platform linux/amd64 -f Dockerfile .
.PHONY: build-prod-push-fpm-83-alpine
