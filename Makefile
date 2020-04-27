LASTTAG := $(shell git describe --abbrev=0 --tags 2>/dev/null)

GOCMD=go
GOBUILD=$(GOCMD) build
LDFLAGS=-X github.com/markkuit/golang-template/internal/commons.Version=$(LASTTAG)
BINDIR=$(CURDIR)/bin
BINNAME=golang-template

default: build run
build:
	$(GOBUILD) -ldflags "$(LDFLAGS)" -v -o $(BINDIR)/$(BINNAME) cmd/golang-template/golang-template.go
run:
	$(BINDIR)/$(BINNAME) $(ARGS)
