#!/usr/bin/env bash

# Setup Commands
set -o errexit
set -o nounset
set -o pipefail

# Colors
mag1='\e[35m'
gr1='\e[32;1m'
nc='\e[0m'

# Reports Directory 
DIR="reports"

# Ececuting commands
main() {
    banner
    chk_dir "$DIR"
    hyper
    plot
}

# Reading commands from com.txt
COMM1=$(head -1 com.txt)
COMM2=$(tail -1 com.txt)

# Use the commands
printf "$gr1
Commands being compared
---
COMM1: $COMM1
COMM2: $COMM2
"

# Exedcuting Hyperfine 
hyper() {
    hyperfine \
    -N \
    --warmup 10 \
    "$COMM1" \
    "$COMM2" \
    --export-json "$DIR"/run.json \
    --export-markdown "$DIR"/run.md \
    --ignore-failure
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
---
Comparing $COMM1 and $COMM2
---
$nc"
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