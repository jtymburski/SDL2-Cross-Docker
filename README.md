# SDL2-Cross-Docker

This image aims to provide support for building SDL2 (libsdl2) for both linux flavors and windows 64-bit.

Instead of using the conventional cmake, it is built to just use make. Builds are not expected to be fully static with dlls
required on windows due to proprietary image, mixer, and ttf libraries

For a sample Makefile, see [this SDL2 project](https://github.com/jtymburski/FIS-Engine).

Contains:
* gcc/g++ toolchain
* SDL2, SDL2_image, SDL2_ttf, SDL2_mixer libraries
* Support for building 64-bit Linux builds
* Support for building 64-bit MinGW builds

Tags: libsdl2, sdl2, gcc, g++, mingw, make
