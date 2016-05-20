SHELL=/bin/bash

# Don't forget to add --insecure-registry <docker-registry> to DOCKER_OPTS
PLATFORM_REGISTRY?=http://127.0.0.1:5000

ifndef BUILD_TAG
BUILD_TAG?=latest
endif

mkfile_path=$(abspath $(lastword $(MAKEFILE_LIST)))
current_dir=$(dir $(mkfile_path))

