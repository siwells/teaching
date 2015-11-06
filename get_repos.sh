#!/bin/bash

filename="$1"
lastname="DEFAULT"
firstname="DEFAULT"
reponame="DEFAULT"
repo="DEFAULT"
sep="_"
while read -r line
    do
        ln="$line"
        
        IFS=','
        read -a array <<< "$line"
        lastname=${array[0]}
        firstname=${array[1]}
        repo=${array[2]}
        reponame="$lastname$sep$firstname"
        reponame=`echo $reponame | tr '[:upper:]' '[:lower:]'`
        echo "$reponame"
        `git clone $repo $reponame`
    done < "$filename"
