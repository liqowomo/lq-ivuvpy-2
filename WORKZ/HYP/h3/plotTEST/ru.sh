#!/usr/bin/env bash

set -euo pipefail

mag1='\e[35m'

main() {
    banner
    plot
}

banner() {
    printf "$mag1 Plot Generation Test"
}

plot() {
    ./plot_whisker.py --title PantySmells hfrun.json -o 1.png
}

# Execute Main Function 
main 
