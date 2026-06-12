#!/bin/bash

echo "Rebuilding site."
rm -rf docs/
mkdir docs/
cp -r assets/* docs/
for page in pages/*.html; do
	echo -n "> building ${page#pages/}..."
	sh ./scripts/buildpage.sh "$page"
	echo "done"
done
echo "finished !"
