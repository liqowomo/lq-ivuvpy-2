#!/usr/bin/env bash

# Setup Commands
set -o errexit
set -o nounset
set -o pipefail

# Colors
mag1='\e[35m'

# Ececuting commands

main() {
    banner
    DIR="reports"
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
    --export-json report/run.json \
    --export-markdown report/run.md 
}

# Make Boxplot
plot() {
     ./p_w.py --title PantySmells report/run.json -o report/run_plot.png
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