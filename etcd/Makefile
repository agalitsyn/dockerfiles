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

exec:
	docker exec -t -i $(COMPONENT) $(ETCDCTL_BIN)

logs:
	@-docker logs -f $(COMPONENT)

clean-containers:
	docker rm -f $$(docker ps -q -a -f name=$(COMPONENT))

clean-images:
	docker rmi -f $$(docker images -q $(IMAGE_PREFIX)/$(COMPONENT))

clean-all: clean-containers clean-images

dump-etcd:
	@-curl -sSL $(DOCKER0_INTERFACE_ADDRESS):$(ETCD_PORT)/v2/keys/?recursive=true | python -m json.tool
