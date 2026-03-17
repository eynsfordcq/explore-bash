#!/bin/bash

# expr command
echo "Addition: $(expr 30 + 10)"
echo "Subtraction: $(expr 30 - 10)"
echo "Division: $(expr 30 / 10)"
echo "Multiplication: $(expr 100 \* 4)"

# Using variables with expr
my_num=100
echo "Using variables: $(expr $my_num + 50)"
