#!/usr/bin/env bash

# Setup Commands
set -o errexit
set -o nounset
set -o pipefail

# Colors
RED='\x[0;31m'
GREEN='\x[0;32m'
NC='\x[0m' # No Color

# Ececuting commands

main() {
    hyper
    plot
}

hyper() {
    hyperfine \
    -N \
    --warmup 50 \
    'ls' \
    'eza' \
    --export-json hfrun.json \
    --export-markdown hfrun.md 
}

# Male plot 

plot() {
    ./scr/scripts/plot_histogram.py hfrun.json -o plots/ph1.png
    ./scr/scripts/plot_progression.py hfrun.json -o plots/ph2.png
    ./scr/scripts/plot+whister.py hfrun.json -o plots/ph3.png
}


# Execute main
main