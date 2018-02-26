# Teaching

Miscellaneous scripts &amp; tools related to teaching activities

## Marking.sh

Takes a CSV extracted from tracker and creates individual marking sheets from template.tex

### Prepping the CSV input file

[1] Copy name+number from admin sheet
[2] Save to CSV
[3] Use marking script to produce student mark sheets, e.g. ./marking.sh class.csv

      $ ./marking.sh classlist.csv cw1_template.tex
