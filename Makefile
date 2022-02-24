# Target OS detection
ifeq ($(OS),Windows_NT) # OS is a preexisting environment variable on Windows
	OS = windows
else
	UNAME := $(shell uname -s)
	ifeq ($(UNAME),Darwin)
		OS = macos
	else ifeq ($(UNAME),Linux)
		OS = linux
	else
		$(error OS not supported by this Makefile)
	endif
endif

build/source/libm3.a:
ifeq ($(OS),macos)
	cmake -B build . -DCMAKE_OSX_DEPLOYMENT_TARGET=10.10
else ifeq ($(OS),windows)
	cmake -B build -G "MinGW Makefiles" .
else
	cmake -B build .
endif
	cmake --build build --target m3

clean:
	rm -fr build
