#!/bin/bash

#!/bin/bash

# 1. Standard Interactive Input (Keyboard)
# The 'read' command pauses and waits for the user to type into stdin.
echo "Please enter your name:"
read myname
echo "Hello, $myname!"

# 2. Input Redirection (File)
# You can run this script using: ./script.sh < names.txt
# The 'read' command will take the first line of the file as 'myname'.
# This is useful for automating scripts that usually require manual typing.

# 3. Pipes (Command Output)
# You can run this script using: echo "Alice" | ./script.sh
# The output of 'echo' is fed directly into the stdin of the script.