#!/usr/bin/env bash
set -ex

# Variables not set for MSYS2 toolchain
FC="${FC:-gfortran}"
CC="${CC:-gcc}"
AR="${AR:-ar}"

if [[ "${CONDA_BUILD_CROSS_COMPILATION:-0}" == "1" ]]; then
  # MACOSX_DEPLOYMENT_TARGET is for the target_platform and not for build_platform
  _MACOSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET}
  unset MACOSX_DEPLOYMENT_TARGET
else
  # We need to fix the Fortran compiler for MacOS/x86_64
  FC_FOR_BUILD="${FC}"
fi

# First, build our bootstrapper version
bootstrap=build/bootstrap
mkdir -p $bootstrap
"${FC_FOR_BUILD}" -J $bootstrap -o $bootstrap/fpm $bootstrap/fpm.F90

# Set environment variables for fpm to the actual compiler
export FPM_FC="${FC}"
export FPM_CC="${CC}"
export FPM_AR="${AR}"
export FPM_LDFLAGS="${LDFLAGS}"
export FPM_FCFLAGS="${FCFLAGS}"
export FPM_CFLAGS="${CFLAGS}"
if [ -z ${_MACOSX_DEPLOYMENT_TARGET+x} ]; then
  export MACOSX_DEPLOYMENT_TARGET=${_MACOSX_DEPLOYMENT_TARGET}
fi

# Build actual full fpm version
$bootstrap/fpm install --prefix "${PREFIX}"
