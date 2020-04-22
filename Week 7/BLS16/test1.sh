#!/bin/bash
trap "echo ' Sorry! I have trapped Ctrl-C'" 
SIGINT 
echo This is a test script 
count = 1 
While [ $count -le 10 ]
do
    echo "loop #$count"
    sleep 1
    count=$[ $count + 1 ]
done
echo "This is the end of the test script"

