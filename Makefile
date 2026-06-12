PAGES=$(wildcard pages/*.html)
ASSETS=$(wildcard assets/*)
all: docs $(subst pages/, docs/, $(PAGES))
.PHONY: all clean test

public/%.html: pages/%.html layout/before.html layout/after.html
	./scripts/buildpage.sh $< > $@


public: $(ASSETS)
	mkdir -p $@
	cp $? $@
	touch $@

clean:
	rm -rf public/

test: all
	python3 -m http.server --directory public
