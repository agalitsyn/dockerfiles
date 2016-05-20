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

# use it with etcd
dev-env:
	@-docker exec -it etcd /etcdctl set \
			/services/$(SERVICE)/config/user $(RABBIT_USERID); \
		docker exec -it etcd /etcdctl set \
			/services/$(SERVICE)/config/password $(RABBIT_PASSWORD); \
		docker exec -it etcd /etcdctl set \
			/services/$(SERVICE)/config/port $(RABBIT_PORT)	
