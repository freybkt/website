PAGES=$(wildcard pages/*.html)
ASSETS=$(wildcard assets/*)
all: docs $(subst pages/, docs/, $(PAGES))
.PHONY: all clean test

docs/%.html: pages/%.html layout/before.html layout/after.html
	./scripts/buildpage.sh $< > $@


docs: $(ASSETS)
	mkdir -p $@
	cp $? $@
	touch $@

clean:
	rm -rf docs/

test: all
	python3 -m http.server --directory docs
