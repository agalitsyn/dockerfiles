include ../../globals.mk

COMPONENT=memcached
SERVICE=memcached
BUILD_TAG=latest

DOCKER_RUN_OPTS=-e SERVICE_$(MEMCACHED_PORT)_NAME=services/$(SERVICE) \
				-e SERVICE_$(MEMCACHED_PORT)_ID=url \
				-p $(MEMCACHED_PORT):$(MEMCACHED_PORT)
