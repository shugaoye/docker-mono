DOCKER = docker
IMAGE = shugaoye/docker-mono:ubuntu16.04_mono
VOL1 ?= $(HOME)/vol1
VOL2 ?= $(HOME)/.ccache

mono: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

test:
        $(DOCKER) run -v "$(VOL1):/root" -v "$(VOL2):/tmp/ccache" -i -t $(IMAGE) /bin/bash

all: mono

.PHONY: all
