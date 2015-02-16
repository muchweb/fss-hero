SOURCES := $(wildcard src/*.coffee)
LIBS1   := $(SOURCES:.coffee=.js)
LIBS    := $(subst src,lib,$(LIBS1))

all: $(LIBS)

$(LIBS): ./node_modules/.bin/coffee $(SOURCES)
	mkdir -p lib
	for file in $(SOURCES); do \
		replaced=$$(echo "$${file}" | sed 's/src/lib/') && \
		echo "one $${replaced}" && \
		replaced=$$(echo "$${replaced}" | sed 's/\(.*\.\)coffee/\1js/') && \
		echo "$${file} two $${replaced}" && \
		./node_modules/.bin/coffee --compile --stdio < "$${file}" > "$${replaced}" ; \
	done

./node_modules/.bin/coffee:
	npm install coffee-script

clean:
	rm -r lib
