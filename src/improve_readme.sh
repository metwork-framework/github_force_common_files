#!/bin/bash

function usage() {
    echo "usage: improve_readme.sh /full/path/README.md"
}

if test "$1" = ""; then
    usage
    exit 1
fi
if test "$1" = "--help"; then
    usage
    exit 0
fi

markdown-enum "$1" 2 "/tmp/readme.$$"
mv -f "/tmp/readme.$$" "$1"

echo "**Table of contents**" >/tmp/readme_toc.$$
echo "" >>/tmp/readme_toc.$$

cat "$1" |grep -v '^# ' |gh-md-toc --depth=2 --hide-footer --hide-header >>/tmp/readme_toc.$$

python <<EOF
with open("$1", "r") as f:
    content = f.read()

with open("/tmp/readme_toc.$$", "r") as g:
    toc = g.read()

content = content.replace("[//]: # (TABLE_OF_CONTENTS_PLACEHOLDER)", toc)

with open("$1", "w") as h:
    h.write(content)
EOF

rm -f "/tmp/readme_toc.$$"
