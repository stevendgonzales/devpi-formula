.PHONY: clean-pyc clean-build

BUILD_NUMBER := $(shell date +%Y%m%d%H%M%S)

clean-pkg:
	find ../ -name 'devpi-formula_*_amd64.changes' -exec rm -f {} +
	find ../ -name 'devpi-formula_*_amd64.deb' -exec rm -f {} +
	find ../ -name 'devpi-formula_*.dsc' -exec rm -f {} +
	find ../ -name 'devpi-formula_*.tar.gz' -exec rm -f {} +

debian: clean-pkg
	$(eval VERSION := $(shell cat VERSION).$(BUILD_NUMBER).$(shell git rev-parse --abbrev-ref HEAD))
	cp debian/changelog debian/changelog.save
	dch -v$(VERSION) auto-build
	dpkg-buildpackage -b -us -uc
	mv debian/changelog.save debian/changelog