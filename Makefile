ifeq ($(shell uname), Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/release/libmapi.${EXT}

target/release/libmapi.${EXT}: src/lib.rs Cargo.toml
	cargo build --release

test: target/debug/libmapi.$(EXT)

target/debug/libmapi.$(EXT): src/lib.rs Cargo.toml
	cargo build

clean:
	rm -rf target