# 
# Main makefile for the addon
# You should avoid modifying this. Instead modify CONFIG.local
#
TOP=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
include CONFIG.local


all: dist 

# dist will build a gma archive of your mod
dist: "$(ADDON).gma"

# publish will publish the addon to the workshop for the first time
# It does not require an ID
upload: "$(ADDON).gma"
	@echo "==== Publishing Addon ===="
	LD_LIBRARY_PATH="$(GMOD_TOP)/bin" "$(GMOD_TOP)/bin/gmpublish_linux" create -icon "$(TOP)/$(ICON)" -addon "$(ADDON).gma"

# Publish will push your changes to the workshop
# Change descriptions are stored in the RELEASE file and passed to the -changes flag
publish: "$(ADDON).gma"
	@echo "==== Upading Addon on Workshop ===="
	LD_LIBRARY_PATH="$(GMOD_TOP)/bin" "$(GMOD_TOP)/bin/gmpublish_linux" update -icon "$(ICON)" -addon "$(ADDON).gma" -id "$(ID)" -changes "$(shell cat RELEASE)"

# Install simply creates a link in your gmod addons folder
install:
	ln -s "$(TOP)/src" "$(GMOD_TOP)/garrysmod/addons/$(ADDON)"


"$(ADDON).gma":
	@echo "==== Building GMA Archive ===="
	"$(GMOD_TOP)/bin/gmad_linux" create -folder src -out "$(ADDON).gma" 

