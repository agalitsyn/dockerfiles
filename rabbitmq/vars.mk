COMPONENT=rabbitmq
SERVICE=messaging
BUILD_TAG=latest

REPOSITORY=$(COMPONENT)
IMAGE=$(REPOSITORY):$(BUILD_TAG)

RABBIT_PORT=5672
RABBIT_USERID=guest
RABBIT_PASSWORD=guest

SHELL=/bin/bash

# service env for gliderlabs/registrator
DOCKER_RUN_OPTS=--env SERVICE_$(RABBIT_PORT)_NAME=services/$(SERVICE)/hosts \
				--publish $(RABBIT_PORT):$(RABBIT_PORT)
