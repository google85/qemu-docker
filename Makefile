DOCKER_IMAGE_NAME=google85/qemu-docker

help: ## View all make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run: ## Run the container
	docker compose up -d

stop: ## Stop & remove the container
	docker compose down

build: ## Build the images
	docker build . -t ${DOCKER_IMAGE_NAME}:win-xp

push: ## Push the builded image to the registry
	docker push ${DOCKER_IMAGE_NAME}:win-xp
