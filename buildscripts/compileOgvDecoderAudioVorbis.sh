#!/bin/bash

. ./buildscripts/compile-options.sh

# compile wrapper around libogg + libvorbis
emcc \
  $EMCC_COMMON_OPTIONS \
  $EMCC_ASMJS_OPTIONS \
  $EMCC_NOTHREAD_OPTIONS \
  -s EXPORT_NAME="'OGVDecoderAudioVorbis'" \
  -s EXPORTED_FUNCTIONS="`< src/js/modules/ogv-decoder-audio-exports.json`" \
  -Ibuild/js/root/include \
  -Lbuild/js/root/lib \
  build/js/root/lib/libogg.$suffix \
  build/js/root/lib/libvorbis.$suffix \
  --js-library src/js/modules/ogv-decoder-audio-callbacks.js \
  --pre-js src/js/modules/ogv-module-pre.js \
  --post-js src/js/modules/ogv-decoder-audio.js \
  src/c/ogv-decoder-audio-vorbis.c \
  src/c/ogv-ogg-support.c \
  -o build/ogv-decoder-audio-vorbis.js \
&& \
emcc \
  $EMCC_COMMON_OPTIONS \
  $EMCC_WASM_OPTIONS \
  $EMCC_NOTHREAD_OPTIONS \
  -s EXPORT_NAME="'OGVDecoderAudioVorbisW'" \
  -s EXPORTED_FUNCTIONS="`< src/js/modules/ogv-decoder-audio-exports.json`" \
  -Ibuild/js/root/include \
  -Lbuild/js/root/lib \
  build/js/root/lib/libogg.$suffix \
  build/js/root/lib/libvorbis.$suffix \
  --js-library src/js/modules/ogv-decoder-audio-callbacks.js \
  --pre-js src/js/modules/ogv-module-pre.js \
  --post-js src/js/modules/ogv-decoder-audio.js \
  src/c/ogv-decoder-audio-vorbis.c \
  src/c/ogv-ogg-support.c \
  -o build/ogv-decoder-audio-vorbis-wasm.js \
