#!/bin/bash

mynum=200

if [ $mynum -eq 200 ]
then
    echo "The condition is true."
fi

# file and dir operators
if [ -f ~/myfile ]
then
    echo "The file exists."
else
    echo "The file does not exist."
fi