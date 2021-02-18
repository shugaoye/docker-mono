DOCKER = docker
IMAGE = shugaoye/mono:6.12.0.107

dev: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

test:
	./run_image.sh $(IMAGE)

all: dev

.PHONY: all
