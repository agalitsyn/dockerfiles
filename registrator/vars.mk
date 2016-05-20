IMAGE_PREFIX=gliderlabs
COMPONENT=registrator
BUILD_TAG=latest

REPOSITORY=$(IMAGE_PREFIX)/$(COMPONENT)
IMAGE=$(REPOSITORY):$(BUILD_TAG)

ETCD_PORT=4001
ETCD_PROTOCOL=http

DOCKER0_INTERFACE_ADDRESS=$(shell CID=$$(docker run -d busybox sleep 1000); docker inspect -f='{{ .NetworkSettings.Gateway }}' $$CID ; docker rm --force $$CID >/dev/null 2>&1)

DOCKER_RUN_OPTS=--volume=/var/run/docker.sock:/tmp/docker.sock

DOCKER_RUN_ARGS=-ip $(DOCKER0_INTERFACE_ADDRESS) -ttl 10 -ttl-refresh 5 \
	etcd://$(DOCKER0_INTERFACE_ADDRESS):$(ETCD_PORT) -resync 30
