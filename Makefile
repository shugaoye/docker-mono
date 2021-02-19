DOCKER = docker
IMAGE = shugaoye/docker-mono:latest

dev: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

test:
	./run_image.sh $(IMAGE)

all: dev

.PHONY: all
