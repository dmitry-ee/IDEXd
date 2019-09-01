.EXPORT_ALL_VARIABLES:
APP_VERSION     = $(shell git describe --abbrev=0 --tags)
APP_NAME        = idexd
DOCKER_ID_USER  = dmi7ry

.ONESHELL:

all: build

build:
	docker build -t $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION) .
builds:
	docker build --squash -t $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION) .

build-nc:
	docker build --squash --no-cache -t $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION) .

run:
	docker run --name=$(APP_NAME) --rm -it $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION)

bash:
	docker run -it $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION) bash

dive:
	dive $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION)

publish: build push

push:
	docker push $(DOCKER_ID_USER)/$(APP_NAME):$(APP_VERSION)
