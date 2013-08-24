
PREFIX=${HOME}/World of Warcraft/Interface/AddOns/Atemi

FILES=embeds.xml Atemi.lua Atemi.toc AtemiCooldown.lua FreeUniversal-Regular.ttf README TODO

dist:
	rm -rf Atemi
	mkdir -p Atemi
	cp -rvp ${FILES} Atemi/
	cp -rvp locale Atemi/
	cp -rvp libs Atemi/
	grep "Version: " Atemi.toc | awk '{print $$3}'
	zip -9 -r Atemi-$(shell grep "Version: " Atemi.toc | awk '{print $$3}').zip Atemi
	rm -rf Atemi

copy:
	@echo "Installing into ${PREFIX} ..."
	rm -rf "${PREFIX}"/*
	mkdir -p "${PREFIX}"
	cp -rp * "${PREFIX}"

.PHONY: dist copy
