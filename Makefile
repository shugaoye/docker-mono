DOCKER = docker
IMAGE = shugaoye/mono:p2.5.2

dev: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

test:
	./run_image.sh $(IMAGE)

all: dev

.PHONY: all
