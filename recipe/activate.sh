conda_ocl_icd_activate () {
    if [[ -z "`ls ${CONDA_PREFIX}/etc/OpenCL/vendors/`" ]]; then
        echo "WARNING: No ICDs were found. Either,";
        echo "- Install a conda package providing a OpenCL implementation (pocl, oclgrind, intel-compute-runtime, beignet) or ";
        if [[ ! -f /etc/OpenCL/vendors/*.icd ]]; then
            echo -n "- Make ";
        else
            echo -n "- Install an OpenCL implementation system-wide and make ";
        fi
        echo "your system-wide implementation visible by installing ocl-icd-system conda package. ";
    fi;
}

conda_ocl_icd_activate || true
