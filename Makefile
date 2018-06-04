push: push-cli-dev push-cli push-http-dev push-http
build: build-cli-dev build-cli build-http-dev build-http
ci-push-cli: ci-docker-login push-cli-dev push-cli
ci-push-http: ci-docker-login push-http-dev push-http

.PHONY: *

# Docker image builds
build-cli-dev:
	docker build -t usabillabv/php-base:cli-dev -f Dockerfile-cli --target=cli-dev .
build-cli:
	docker build -t usabillabv/php-base:cli -f Dockerfile-cli --target=cli .
build-http-dev:
	docker build -t usabillabv/php-base:http-dev -f Dockerfile-http --target=http-dev .
build-http:
	docker build -t usabillabv/php-base:http -f Dockerfile-http --target=http .

# Docker image push
push-cli-dev: build-cli-dev
	docker push usabillabv/php-base:cli-dev
push-cli: build-cli
	docker push usabillabv/php-base:cli
push-http-dev: build-http-dev
	docker push usabillabv/php-base:http-dev
push-http: build-http
	docker push usabillabv/php-base:http

# CI dependencies
ci-docker-login:
	docker login --username $$DOCKER_USER --password $$DOCKER_PASSWORD

