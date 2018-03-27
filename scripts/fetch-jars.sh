#!/bin/bash

set -eu

TMPDIR="$(pwd)/tmp"
JARDIR="$(pwd)/tmp/jars"
mkdir -p "$JARDIR"

echo "This fetches all the needed jars from github to $JARDIR"
curl -L -o $JARDIR/cloc2flare.jar https://github.com/kornysietsma/cloc2flare/releases/download/1.0.0/cloc2flare.jar
curl -L -o $JARDIR/csvmerge2flare.jar https://github.com/kornysietsma/csvmerge2flare/releases/download/1.0.0/csvmerge2flare.jar
curl -L -o $JARDIR/code-maat-1.1-SNAPSHOT-standalone.jar https://github.com/kornysietsma/csvmerge2flare/releases/download/1.0.0/code-maat-1.1-SNAPSHOT-standalone.jar
curl -L -o $JARDIR/indent2flare.jar https://github.com/kornysietsma/indent2flare/releases/download/1.0.0/indent2flare.jar

echo "done."
