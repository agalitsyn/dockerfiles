include globals.mk

build-%:
	$(MAKE) -C $$(echo $@ | cut -c 7-) build

build: \
	build-webmock

clean-all:
	$(MAKE) -C webmock clean-all

push:
	$(MAKE) -C webmock push

