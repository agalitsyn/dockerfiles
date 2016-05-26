POSTGRES_PORT=5432
POSTGRES_USER=docker
POSTGRES_PASSWORD=docker

DOCKER_RUN_OPTS=-e SERVICE_$(POSTGRES_PORT)_NAME=services/$(COMPONENT) \
				-e SERVICE_$(POSTGRES_PORT)_ID=url \
				-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
				-e POSTGRES_USER=$(POSTGRES_USER) \
				-p $(POSTGRES_PORT):$(POSTGRES_PORT)

COMPONENT=postgres
BUILD_TAG=9.4

IMAGE=$(COMPONENT):$(BUILD_TAG)

DOCKER0_INTERFACE_ADDRESS=$(shell CID=$$(docker run -d busybox sleep 1000); docker inspect -f='{{ .NetworkSettings.Gateway }}' $$CID ; docker rm --force $$CID >/dev/null 2>&1)

