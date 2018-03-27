#!/bin/bash

set -eu

STARTDIR=$(pwd)
TMPDIR=$(pwd)/tmp
JARDIR=$(pwd)/tmp/jars
mkdir -p $JARDIR

echo "This is only a sample - it fetches the Atom editor and calculates all the metrics we have for it"
echo "I strongly suggest you read the file and adapt it for your needs, rather than just running it"

read -p "hit enter to continue, or break to stop things now :" junk

if [ ! -f $JARDIR/cloc2flare.jar ]; then
  echo "You need to run fetch-jars.sh first"
  exit 1
fi

rm -f $TMPDIR/tmp*.json

if [ ! -d $TMPDIR/atom ]; then
  echo "cloning atom source code"
  cd $TMPDIR
  git clone https://github.com/atom/atom.git
fi

cd $TMPDIR/atom

set -x

cloc . --by-file --yaml --quiet | java -Xmx8G -jar $JARDIR/cloc2flare.jar > $TMPDIR/tmp_flare_1.json
git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN'  --since=2013-03-01 --no-renames > $TMPDIR/tmp_git_log.log
java -Xmx8G -XX:-UseGCOverheadLimit -jar $JARDIR/code-maat-1.1-SNAPSHOT-standalone.jar -l $TMPDIR/tmp_git_log.log -c git2 -a age -o $TMPDIR/tmp_age.csv
java -Xmx8G -XX:-UseGCOverheadLimit -jar $JARDIR/code-maat-1.1-SNAPSHOT-standalone.jar -l $TMPDIR/tmp_git_log.log -c git2 -a authors -o $TMPDIR/tmp_authors.csv

java -Xmx8G -jar $JARDIR/indent2flare.jar < $TMPDIR/tmp_flare_1.json > $TMPDIR/tmp_flare_2.json

java -Xmx8G -jar $JARDIR/csvmerge2flare.jar -b $TMPDIR/tmp_flare_2.json -i $TMPDIR/tmp_authors.csv -c code-maat -o $TMPDIR/tmp_flare_3.json
java -Xmx8G -jar $JARDIR/csvmerge2flare.jar -b $TMPDIR/tmp_flare_3.json -i $TMPDIR/tmp_age.csv -c code-maat -o $TMPDIR/tmp_flare_4.json

set +x

cp $TMPDIR/tmp_flare_4.json $STARTDIR/atom_metrics.json
cd $STARTDIR
echo "produced atom_metrics.json - converting to atom_metrics.js for the explorer"

(
  echo -n "export const atom_rawData = "
  cat atom_metrics.json
  echo ";"
  echo "export const atom_chartTitle = \"Atom Editor\";"
  echo "export const atom_urlPrefix = \"https://github.com/atom/atom/tree/master\";"
) > atom_metrics.js

echo "now you need to move atom_metrics.js to the 'docs/js/data' directory and update the 'metrics.js' file there by hand."
