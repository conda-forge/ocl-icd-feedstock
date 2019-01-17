mkdir -p ${PREFIX}/etc/OpenCL/vendors
for filename in /etc/OpenCL/vendors/*.icd; do
    ln -s ${filename} ${PREFIX}/etc/OpenCL/vendors/system-$(basename $filename) || true
    echo "Symlinked $filename from system to conda opencl directory.">> "${PREFIX}/.messages.txt" 2>&1
done

