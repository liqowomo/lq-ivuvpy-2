#!/usr/bin/env bash

# Setup Commands
set -o errexit
set -o nounset
set -o pipefail

# Colors
mag1='\e[35m'

# Reports Directory 
DIR="reports"

# Ececuting commands
main() {
    banner
    chk_dir "$DIR"
    hyper
    plot
}

COMM1="ls"
COMM2="eza"

# Exedcuting Hyperfine 
hyper() {
    hyperfine \
    -N \
    --warmup 10 \
    "$COMM1" \
    "$COMM2" \
    --export-json "$DIR"/run.json \
    --export-markdown "$DIR"/run.md 
}

# Make Boxplot
plot() {
     ./p_w.py  \
     --title "$COMM1 vs $COMM2" \
     "$DIR"/run.json -o "$DIR"/run_plot.png
}

# Banner function
banner() {
    printf "$mag1 
Plot Generation Test
"
}

# Directory Check 
chk_dir() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Directory $1 created."
  else
    echo "Directory $1 already exists."
  fi
}

# Execute main
main