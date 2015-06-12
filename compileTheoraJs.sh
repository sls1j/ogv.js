#!/bin/bash

dir=`pwd`

# set up the build directory
mkdir build
cd build

mkdir js
cd js

mkdir root
mkdir libtheora
cd libtheora

# finally, run configuration script
emconfigure ../../../libtheora/configure \
	--host=asmjs-local-emscripten \
	--disable-oggtest \
	--prefix="$dir/build/js/root" \
	--with-ogg="$dir/build/js/root" \
	--disable-asm \
	--disable-examples \
	--disable-encode

# compile libtheora
emmake make
emmake make install

cd ..
cd ..
cd ..
