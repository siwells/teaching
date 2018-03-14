#!/bin/bash

pushd $1
while read p; do
  git clone $p
done <../repos.txt
popd

