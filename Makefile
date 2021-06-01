#!make

#######
# Usage example:
# $ make tests [additionalArgs="--verbose"]


# Include .env file vars
export HOST_USER=$(shell id -u):$(shell id -g)


# Run PHPUnit test suite
tests:
	docker-compose run web php ./vendor/bin/phpunit --no-coverage $(additionalArgs)

# PHP Static Analysis Tool (https://github.com/phpstan/phpstan). Check for errors and potential bugs.
run-phpstan:
	docker-compose run web php vendor/bin/phpstan analyse src tests --level 3

composer-install:
	docker run --rm -v $$(pwd):/app composer:2 composer install

composer-update:
	docker run --rm -v $$(pwd):/app composer:2 composer update

composer-validate:
	docker run --rm -v $$(pwd):/app composer:2 composer validate

# .PHONY is a pseudo-target needed to re-trigger the commands execution
# otherwise en error would be raised.
.PHONY: tests
