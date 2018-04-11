IMAGE   ?= ashanaakh/internship
VERSION ?= latest
SERVICE ?= quest

default: build run exec

build:
	@docker build -t $(IMAGE) .

push:
	@docker push $(IMAGE)

run: build
	@docker run -p 80:80 --name $(SERVICE) -d $(IMAGE)

exec:
	@docker exec -it $(SERVICE) bash

clean:
	@docker rm -f $(SERVICE)
