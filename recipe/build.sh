#!/bin/bash

set -ex

export OCL_ICD_VENDORDIR="${PREFIX}/etc/OpenCL/vendors"

# Make sure `conda-build` keeps this directory.
mkdir -p "${OCL_ICD_VENDORDIR}"
touch "${OCL_ICD_VENDORDIR}/.conda_keep"

./bootstrap

./configure \
  --prefix=$PREFIX \
  --enable-official-khronos-headers \
  --enable-custom-vendordir="${OCL_ICD_VENDORDIR}" || (cat config.log; false)

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check
fi
make install
