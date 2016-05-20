MARIADB_PORT=3306
MARIADB_VERSION=5.5
MARIADB_USER=root
MARIADB_PASSWORD=setup

COMPONENT=mariadb
SERVICE=database
BUILD_TAG=$(MARIADB_VERSION)

REPOSITORY=$(COMPONENT)
IMAGE=$(REPOSITORY):$(BUILD_TAG)

SHELL=/bin/bash
DOCKER0_INTERFACE_ADDRESS=$(shell CID=$$(docker run -d busybox sleep 1000); docker inspect -f='{{ .NetworkSettings.Gateway }}' $$CID ; docker rm --force $$CID >/dev/null 2>&1)

ETCD_PORT=4001
ETCD_PROTOCOL=http
ETCD_RAW_DATA_PARSER_CMD=python -m json.tool | awk '/value/ {print $$2}' | sed -e 's/^"//' -e 's/"$$//'

DOCKER_RUN_OPTS=--env TERM=xterm \
				--env SERVICE_$(MARIADB_PORT)_NAME=services/$(SERVICE) \
				--env SERVICE_$(MARIADB_PORT)_ID=url \
				--env MYSQL_ROOT_PASSWORD=$(MARIADB_PASSWORD) \
				--volume $$(pwd)/local.conf:/etc/mysql/conf.d/local.conf \
				--publish $(MARIADB_PORT):$(MARIADB_PORT)

