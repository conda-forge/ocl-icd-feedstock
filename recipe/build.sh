set -e

./bootstrap

./configure \
  --prefix=$PREFIX \
  --enable-official-khronos-headers \
  --enable-custom-vendordir=$PREFIX/etc/OpenCL/vendors

make
make check
make install
