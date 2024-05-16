ifeq ($(shell uname),Darwin)
	EXT := dylib
else ifeq ($(OS),Windows_NT)
	EXT := dll
else
	EXT := so
endif

all: target/release/whichlang.$(EXT)
	LIBRARY_PATH=$(PWD)/target/release:$(LIBRARY_PATH) crystal build --static src/whichlang.cr -o whichlang
	LD_LIBRARY_PATH=./target/release ./whichlang

target/release/whichlang.$(EXT): src/lib.rs Cargo.toml
	cargo build --release
	cd src

clean:
	rm -rf target whichlang whichlang.dwarf
