#!/bin/bash

VOLTDIST="voltdb"

function help() {
    echo "Usage: ./build.sh path-to-voltdb-download.tar.gz <image name>"
}

if [ $# -ne 2 ]; then help; exit; fi

# download and extract volt
rm -rf "$VOLTDIST"
mkdir "$VOLTDIST"
curl -sL $1 | tar xzC "$VOLTDIST" --strip-components 1

# build the docker image
docker build --force-rm=true -t "$2" .

