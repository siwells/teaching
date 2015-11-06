#!/bin/bash

infile=$1
outfile=`basename $infile .csv`

cat "$infile" | sed 's/^.//' | sed "s/\'//g" | sed 's/, /_/g' | sed 's/",/,/g' | sed 's/ /_/g' | sed '/.git/!d' > "$outfile""_clean.csv" 
