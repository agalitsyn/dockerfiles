IMAGE_PREFIX=quay.io/coreos
COMPONENT=etcd
BUILD_TAG=latest

REPOSITORY=$(IMAGE_PREFIX)/$(COMPONENT)
IMAGE=$(REPOSITORY):$(BUILD_TAG)

ETCD_PORT=4001
ETCD_PROTOCOL=http
ETCDCTL_BIN=/etcdctl

DOCKER0_INTERFACE_ADDRESS=$(shell CID=$$(docker run -d busybox sleep 1000); docker inspect -f='{{ .NetworkSettings.Gateway }}' $$CID ; docker rm --force $$CID >/dev/null 2>&1)

# service env is for gliderlabs/registrator
DOCKER_RUN_OPTS=--env SERVICE_$(ETCD_PORT)_NAME=$(COMPONENT) \
				--publish $(ETCD_PORT):$(ETCD_PORT)

DOCKER_RUN_ARGS=-advertise-client-urls $(ETCD_PROTOCOL)://$(DOCKER0_INTERFACE_ADDRESS):$(ETCD_PORT) \
	-listen-client-urls $(ETCD_PROTOCOL)://0.0.0.0:$(ETCD_PORT)

