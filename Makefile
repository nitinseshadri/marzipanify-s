# Makefile
CC=clang

all: main.m 
	$(CC) -o marzipanify main.m -fobjc-arc -fmodules
remove-x86:
	-lipo "./$(APPNAME).app/$(BINNAME)" -remove x86_64 -output "./$(APPNAME).app/$(BINNAME)"
remove-arm64:
	-lipo "./$(APPNAME).app/$(BINNAME)" -remove arm64 -output "./$(APPNAME).app/$(BINNAME)"
codesign:
	codesign --force -s - ./*.app/Contents/MacOS/*
	codesign --force -s - ./*.app/Contents/Frameworks/*.dylib
unquarantine:
	xattr -rd com.apple.quarantine ./*.app/
clean: 
	$(RM) marzipanify