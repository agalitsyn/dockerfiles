include vars.mk

pull:
	docker pull $(IMAGE)

start: stop
	@-docker run -d --name=$(COMPONENT) $(DOCKER_RUN_OPTS) $(IMAGE) $(DOCKER_RUN_ARGS)
	@-docker logs $(COMPONENT)

stop:
	@-docker stop $(COMPONENT)
	@-docker rm $(COMPONENT)

restart: stop start

enter:
	docker exec -t -i $(COMPONENT) $(SHELL)

logs:
	@-docker logs -f $(COMPONENT)

clean-containers:
	docker rm -f $$(docker ps -q --all -f name=$(COMPONENT);status=exited)

clean-images:
	docker rmi -f $$(docker images -q $(IMAGE_PREFIX)/$(COMPONENT))

clean-all: clean-containers clean-images

# works if you use registrator
get-connection-url:
	@-curl -sSL $(ETCD_PROTOCOL)://$(DOCKER0_INTERFACE_ADDRESS):$(ETCD_PORT)/v2/keys/services/mariadb/url | $(ETCD_RAW_DATA_PARSER_CMD)

# use with etcd
dev-env:
		@-docker exec -it etcd /etcdctl set \
				/services/$(SERVICE)/config/user $(MARIADB_USER); \
		docker exec -it etcd /etcdctl set \
				/services/$(SERVICE)/config/password $(MARIADB_PASSWORD); \
		docker exec -it etcd /etcdctl set \
				/services/$(SERVICE)/config/port $(MARIADB_PORT)
