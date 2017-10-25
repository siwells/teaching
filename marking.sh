#!/bin/bash

infile="$1"
studentname="DEFAULT"
studentnumber="DEFAULT"
sep="_"
tex=".tex"
csv=".csv"
outfile="default"$tex
template="template"$tex
#tmptex="tmp"$tex
tmpcsv="tmp"$csv

# Process Class File (CSV)
# Replace ',"' with '|'
# Replace closing '"' with nothing
# Write out to tmp csv file

cat "$infile" | sed -e 's/,"/|/' | sed -e 's/"//' > $tmpcsv

# Process each student in class file

while IFS=$'\r\n' read -r line
    do
        IFS=$'|'
        read -a array <<< "$line"
        studentnumber="${array[0]}"
        studentname="${array[1]}"

        # Construct output filename of form lastname_firstname_matriculationnumber.tex
        outfile=`echo $studentname | sed 's/, /_/'`$sep$studentnumber$tex

        # Construct text for student entry in file with student's name
        nametext="s/student{}/student{"
        nametext+=`echo $studentname | tr '[:upper:]' '[:lower:]' `
        nametext+="}/"

        # Construct text for matriculation number entry in file with student's number
        numtext="s/matric{}/matric{"
        numtext+=$studentnumber
        numtext+="}/"
        
        # Replace lines in template with name & number text then write to new file
        # named according to the student's details
        cat $template | sed -e "$nametext" | sed -e "$numtext"> $outfile

    done < "$tmpcsv"
