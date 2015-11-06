#!/bin/bash

filename="$1"
reponame="DEFAULT"
repo="DEFAULT"
sep="_"
while read -r line
    do
        ln="$line"
        
        IFS=','
        read -a array <<< "$line"
        reponame=${array[0]}
        repo=${array[1]}
        if [[ $repo == *"@bitbucket.org"* ]]
        then
            repo=$( echo $repo| sed 's/.*@/git@/g' | sed 's/.org\//.org:/g')
        fi
        
        reponame=`echo $reponame | tr '[:upper:]' '[:lower:]'`
        echo "$reponame" "$repo"
        `git clone $repo $reponame`
    done < "$filename"
