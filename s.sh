#!/bin/sh

file="./f2/test.txt"

file2=$(echo "$file"|sed "s|\(.*\)/.*|\1|")
echo $file2