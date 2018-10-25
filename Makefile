.PHONY: build all source-repo docs indexes fix-links push clean

build: source-repo docs indexes fix-links

all: build push


build-tools:
	./make-build-tools.sh

source-repo:
	./get-source-repo.sh

docs:
	./extract-docs.sh

indexes:
	./make-indexes.sh

fix-links:
	./fix-links.sh

server:
	./run-server.sh

push:
	./push-to-github.sh

clean:
	./make-clean.sh

distclean:
	./make-distclean.sh
