#!/bin/sh

if sed --version 2>/dev/null | grep -q GNU; then
  echo Use sed
else
  if type "gsed" > /dev/null 2>&1; then
    echo Use gsed
    alias sed='gsed'
  else
    echo You need to install gsed
    echo Exit
    exit 1
  fi
fi

# Get values of code for all characters
# xmllint --xpath "/ttFont/cmap/cmap_format_4/map/@code" $1 |
  # sed -e "s/code=\"\([^\"]*\)\"/\1\n/g" | while read line
# do
  # echo $line | sed -e "s/0x/\\\u/"
# done

# Get values of code for hiragana, katakana, CJK
cat $1 | grep -e HIRAGANA -e KATAKANA -e CJK | sed -e "s/.*code=\"\([^\"]*\)\".*/\1/g" | while read line
do
  echo $line | sed -e "s/0x/\\\u/" >> output.txt
done
