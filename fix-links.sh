#!/bin/bash

shopt -s nullglob

echo "Fixing links in documents"

for file in {branches,tags}/*/docs/*.md; do

    # Change .raml links to .html and rename APIs folder
    perl -pi -e 's:\.raml\):.html\):g; s:/APIs/:/html-APIs/:g;' "$file"

    # Change %20 escaped spaces in links to understores
    perl -ni -e '@parts = split /(\(.*?\.md\))/ ; for ($n = 1; $n < @parts; $n += 2) { $parts[$n] =~ s/%20/_/g; }; print @parts' "$file"

    # Same but for reference links
    perl -ni -e '@parts = split /(\]:.*?\.md)/ ; for ($n = 1; $n < @parts; $n += 2) { $parts[$n] =~ s/%20/_/g; }; print @parts' "$file"

done

echo "Fixing links in HTML rendered APIs"

for file in {branches,tags}/*/html-APIs/*.html; do

    # Change .md links to .html
    perl -pi -e 's:\.md">:.html">:g;' "$file"

    # Change spaces in links to understores
    perl -ni -e '@parts = split /(href="..\/docs\/.*?\.html)/; for ($n = 1; $n < @parts; $n += 2) { $parts[$n] =~ s/ /_/g; }; print @parts' "$file"

done

## Removing the unwanted "schemas/" in .html links due to raml2html v6 workaround
#for file in {branches,tags}/*/html-APIs/*.html; do
#    perl -pi -e 's:schemas/::g;' "$file"
#done
    
