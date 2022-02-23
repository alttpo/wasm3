build/source/libm3.a:
ifeq ($(MSYSTEM),MINGW64)
	cmake -B build -G "MinGW Makefiles" .
else
	cmake -B build .
endif
	cmake --build build
