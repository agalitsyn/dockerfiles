include ../globals.mk

pull-%:
	$(MAKE) -C $$(echo $@ | cut -c 6-) pull

build-pull-%:
	$(MAKE) -C $$(echo $@ | cut -c 12-) build-pull

build: \
	pull-etcd \
	pull-mariadb \
	pull-rabbitmq \
	pull-memcached \

start:
	$(MAKE) -C etcd start
	sleep 2
	$(MAKE) -C mariadb start
	$(MAKE) -C rabbitmq start
	$(MAKE) -C ceph start
	$(MAKE) -C memcached start

stop:
	$(MAKE) -C etcd stop
	$(MAKE) -C mariadb stop
	$(MAKE) -C rabbitmq stop
	$(MAKE) -C ceph stop
	$(MAKE) -C memcached stop

clean-all:
	$(MAKE) -C etcd clean-all
	$(MAKE) -C mariadb clean-all
	$(MAKE) -C rabbitmq clean-all
	$(MAKE) -C ceph clean-all
	$(MAKE) -C memcached clean-all

dev-env:
	$(MAKE) -C rabbitmq dev-env
	$(MAKE) -C mariadb dev-env
