#!/usr/bin/env bash

# Setup Commands
set -o errexit
set -o nounset
set -o pipefail

# Colors 

main() {
    echo "Hello World"
    banner
}

banner() {
   echgo -e ""
   echgo -e ""
   echo -e "----"
   echo -e "----"
   echo -e "----"
   echo -e ""
   echo -e ""
}

# Execute main 
main