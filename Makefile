IMAGE_NAME 	= vouchio/rocksdb-prometheus-exporter
ROOT_DIR 	= $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
VERSION 	= $(shell cat $(ROOT_DIR)/VERSION)

docker-build:
	docker build -t $(IMAGE_NAME):$(VERSION) .

docker-push:
	docker push $(IMAGE_NAME):$(VERSION)
