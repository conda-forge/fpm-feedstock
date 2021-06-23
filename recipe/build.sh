#!/usr/bin/env bash
set -ex

mkdir "${PREFIX}/bin"
${FC} ${LDFLAGS} ${FFLAGS} fpm-*.F90 -o "${PREFIX}/bin/fpm"
