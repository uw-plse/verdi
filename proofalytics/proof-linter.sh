#!/usr/bin/env bash

set -e

PADIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROOF_SIZES="${PADIR}/proof-sizes.csv"

# proof sizes csv
find "${PADIR}/.." -name '*.v' \
  | xargs awk -W lint=fatal -f "${PADIR}/proof-sizes.awk" \
  | awk -W lint=fatal -v key=2 -f "${PADIR}/csv-sort.awk" \
  > "$PROOF_SIZES"
