TAG = python-node:latest

.PHONY: all
all: build

.PHONY: ci
ci: build test

# LOCAL #######################################################################

.PHONY: doctor
doctor:
	pip install --user verchew && python -m verchew --exit-code

# DOCKER ######################################################################

.PHONY: build
build:
	docker build . --tag=$(TAG)

.PHONY: test
test:
	docker run -v $(PWD):/host -i $(TAG) bash -c "cd ~ && cp -a /host/. . && make doctor"
