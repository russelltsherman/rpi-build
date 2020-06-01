
build:
	-docker rm -v pigen_work
	./build-docker.sh
_PHONY: build

clean:
	rm -rf ./deploy
_PHONY: clean
