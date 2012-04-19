PACKAGE=bookmaker
VERSION=v0.1
DEPENDENCIES=debhelper devscripts

.PHONY: default
default: build

.PHONY: build
build: $(PACKAGE)_*.deb
$(PACKAGE)_*.deb:
	git archive $(VERSION) --format=tar | tar x -C $(PACKAGE)
	(cd $(PACKAGE); debuild -b -us -uc; cd ..)

.PHONY: clean
clean:
	rm $(PACKAGE)/bookmaker
	(cd $(PACKAGE); debuild clean; cd ..)
	rm -rf $(PACKAGE)_*
