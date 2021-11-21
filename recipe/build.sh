#!/usr/bin/env bash
set -ex

# First build our bootstrapper version
bootstrap=build/bootstrap
mkdir -p $bootstrap
"${FC_FOR_BUILD:-${FC}}" -J $bootstrap -o $bootstrap/fpm fpm-*.F90

# Set environment variables for fpm
export FPM_FC="${FC}"
export FPM_CC="${CC}"
export FPM_AR="${AR:-ar}"
export FPM_LDFLAGS="${LDFLAGS}"
export FPM_FCFLAGS="${FCFLAGS}"
export FPM_CFLAGS="${CFLAGS}"

# Build actual full fpm version
$bootstrap/fpm install --prefix "${PREFIX}"
