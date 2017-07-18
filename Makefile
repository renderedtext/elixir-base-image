.PHONY: build push


TAG=1.4.4
REPO=renderedtext/elixir
IMAGE=$(REPO):$(TAG)
IMAGE_LATEST=$(REPO):latest

build:
	docker build --cache-from $(IMAGE_LATEST) -t $(IMAGE) .
	docker tag $(IMAGE) $(IMAGE_LATEST)

push: build
	docker push $(IMAGE)
	docker push $(IMAGE_LATEST)

