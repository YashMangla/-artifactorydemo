#!/bin/bash

file1= "f2/test.txt"
file2= $("$file1" | sed "s|\(.*\)/.*|\1|")
echo $file2