#
# Makefile for
#

# Phony targets represents recipes, not files
.PHONY: help debug-build release-build test clean

DEBUG_TGT := target/debug/parseargs
RELEASE_TGT := target/release/parseargs

SRCFILES := $(wildcard src/*.rs src/**/*.rs)


debug-build: ${DEBUG_TGT}                    ## Debug build the application using cargo

release-build: ${RELEASE_TGT}                ## Release build the application using cargo
	cargo build --release

${DEBUG_TGT}: Cargo.toml ${SRCFILES}
	cargo build

${RELEASE_TGT}: Cargo.toml ${SRCFILES}
	cargo build --release

test:                                        ## run Cargo tests and integration tests
	cargo test
	./inttest/run.sh

clean:
	cargo clean

help:                                        ## Prints targets with help text
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m\n    %s\n", $$1, $$2}'
