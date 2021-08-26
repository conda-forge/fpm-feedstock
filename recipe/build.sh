#!/usr/bin/env bash
set -ex

export FPM_C_COMPILER="${CC}"
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-0}" == 1 ]]; then
  fpm install --compiler "${FC}" --flags "${LDFLAGS} ${FFLAGS}" --prefix "${PREFIX}"
else
  export FFLAGS="${LDFLAGS} ${FFLAGS}"
  ./install.sh --prefix="${PREFIX}"
fi
