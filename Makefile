build/source/libm3.a:
ifeq ($(MSYSTEM),MINGW64)
	cmake -B build -G "MinGW Makefiles" .
else
	cmake -B build . -DCMAKE_OSX_DEPLOYMENT_TARGET=10.10
endif
	cmake --build build --target m3

clean:
	rm -fr build
