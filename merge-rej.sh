#!/bin/bash

# This just attempts to merged rejected files.

git ls-files --others --exclude-standard \*.rej | while read reject
do
  file=$(echo ${reject} | sed 's/\.rej$//')
  echo Merging in $file
  rm -f ${file}.porig
  wiggle -r -v $file $reject
  echo Hit enter to open in intellij
  read -s -n 1 key < /dev/tty
  #open -b com.jetbrains.intellij.ce $file
  open -b com.jetbrains.intellij $file
  echo Hit enter when we can remove reject file: 
  read -s -n 1 key < /dev/tty
  rm $reject
done

