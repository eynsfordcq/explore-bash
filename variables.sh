#!/bin/bash

myname="Jay"
myage="40"

echo "Hello, my name is $myname."
echo "I'm $myage years old."

# single quotes: variables treated as literal
echo 'Hello, my name is $myname.'

# subshells
now=$(date)
echo "The system datetime is $now"

# system / environment variables
echo "Your username is $USER, your home directory is $HOME."