PACKAGE=bookmaker
DEPENDENCIES=debhelper devscripts

.PHONY: default
default: build

.PHONY: build
build: $(PACKAGE)_*.deb
$(PACKAGE)_*.deb:
	cp ../../bookmaker $(PACKAGE)/bookmaker
	(cd $(PACKAGE); debuild -b -us -uc; cd ..)

.PHONY: clean
clean:
	rm $(PACKAGE)/bookmaker
	(cd $(PACKAGE); debuild clean; cd ..)
	rm -rf $(PACKAGE)_*
