#!/bin/bash
source ./config

export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/edk2-platforms

cd $WORKSPACE
. edk2/edksetup.sh
if [ ! -f "$WORKSPACE/edk2/BaseTools/Source/C/bin" ]; then
    make -C edk2/BaseTools
fi
build -a X64 -t GCC5 -v -b RELEASE -p i915ovmfPkg/i915ovmf.dsc || exit
build -a X64 -t GCC5 -v -b RELEASE -p edk2/OvmfPkg/OvmfPkgX64.dsc || exit  
