#!/bin/bash

# Version for IS-04 (only) which has both RAML 0.8 and RAML 1.0

echo "Installing build tools"
yarn add raml2html
RAML2HTML_SYMLINK=$(readlink node_modules/.bin/raml2html)
yarn add raml2html-3@npm:raml2html@3
RAML2HTML_3_SYMLINK=$(readlink node_modules/.bin/raml2html)
yarn add jsonlint

echo "Correcting symlinks to support two raml2html versions"
cd node_modules/.bin
rm raml2html
ln -s $RAML2HTML_SYMLINK raml2html
ln -s $RAML2HTML_3_SYMLINK raml2html-3
