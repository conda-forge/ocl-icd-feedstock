set -e

export OCL_ICD_VENDORDIR="${PREFIX}/etc/OpenCL/vendors"

mkdir -p "${OCL_ICD_VENDORDIR}"

./bootstrap

./configure \
  --prefix=$PREFIX \
  --enable-official-khronos-headers \
  --enable-custom-vendordir="${OCL_ICD_VENDORDIR}"

make
make check
make install
