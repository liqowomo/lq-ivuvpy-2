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
}

hyper() {
    hyperfine \
    -N \
    --warmup 50 \
    'ls' \
    'eza' \
    --export-json hfrun.json \
    --export-markdown hfrun.md \
    ./plot
}

# Male plot 

plot() {
    mkdir plots 
    cp *.json plots
    
}


# Execute main
main