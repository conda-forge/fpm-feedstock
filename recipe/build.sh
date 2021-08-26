#!/usr/bin/env bash
set -ex

export FPM_C_COMPILER="${CC}"
fpm install --compiler ${FC} --flags "${LDFLAGS} ${FFLAGS}" --prefix "${PREFIX}"
