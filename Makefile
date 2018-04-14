VERSION ?= latest
SERVICE ?= quest
IMAGE   ?= ashanaakh/$(SERVICE):$(VERSION)

default: build run exec clean

build:
	@docker build -t $(IMAGE) .

push: build
	@docker push $(IMAGE)

run: build
	@docker run -p 80:80 --name $(SERVICE) -d $(IMAGE)

exec:
	@docker exec -it $(SERVICE) bash

clean:
	@docker rm -f $(SERVICE)
