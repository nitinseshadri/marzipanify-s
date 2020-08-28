# Makefile
CC=clang

all: main.m 
	$(CC) -o marzipanify main.m -fobjc-arc -fmodules
codesign:
	codesign --force -s - ./*.app/Contents/MacOS/*
	codesign --force -s - ./*.app/Contents/Frameworks/*.dylib
clean: 
	$(RM) marzipanify