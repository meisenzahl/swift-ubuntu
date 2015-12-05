PROGRAM=$(shell basename $$PWD)

default:
	swift build

run:
	./.build/debug/$(PROGRAM)

clean:
	rm -rf .build
