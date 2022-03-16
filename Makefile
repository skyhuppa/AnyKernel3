# Zip Naming
NAME ?= AtomX
CODENAME ?= lisa
VERSION := v1.0
DATE := $(shell date "+%H%M")

ZIP := $(NAME)-$(CODENAME)-$(VERSION)-$(DATE)
EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

#zipping
zip: $(ZIP)
$(ZIP):
	@echo "Creating ZIP: $(ZIP).zip"
	@zip -r9 "$@.zip" . -q -x $(EXCLUDE)
	@echo "Signing zip with aosp keys..."
	@java -jar *.jar* "$@.zip" "$@-signed.zip"
	@echo "Done!"

#cleaning
clean:
	@rm -rf modules/vendor/lib/modules/modules.{alias,dep,softdep,load}
	@rm -rf modules/vendor/lib/modules/*.ko
	@rm -rf dtbo.img
	@rm -rf *dtb*
	@rm -rf Image
	@rm -rf *.zip*
	@echo "Cleaned Up." 
