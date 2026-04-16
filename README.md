# explore-bash

## Shebang

- A **shebang** is the character sequence `#!` placed at the very beginning of a script file. It tells the operating system **which interpreter should execute the script**.
- Effectively: `/path/to/interpreter ./script.sh`

```sh
# syntax
#!/path/to/interpreter

# example
#!/bin/bash
```

---

## Variables

- **Syntax**: `variable_name="value"`. Note: do not to include spaces around the equal sign (=).
- **Referencing**: prefix the name with a dollar sign (e.g., `$myname`).
- **Quotings**
  - Double Quotes ("): Allow for variable expansion, bash prints the content of that variable
  - Single Quotes ('): Literal string, bash prints the variable name exactly as typed including the `$` sign.

### Subshells

- You can store the output of a command into a variable using the syntax `variable=$(command)`.
- Examples:
  - `now=$(date)`
  - `path=$(pwd)`
  - `files=$(ls)`

### Environment and System Variables

- Linux has pre-defined environment or system variables like `$USER`, `$HOME`
- **Naming Convention**: Use lowercase for user-defined variables and uppercase for system/enviornment variables.

---

## Math

- Bash handles mathematical operations differently from other programming languages. You cannot directly type 30 + 10.
- The `expr` Command:
  - **Syntax**: `expr [number or variable] [operator] [number or variable]`
  - Example for Addition: `expr 30 + 10` will output 40.
  - Example for Subtraction: `expr 30 - 10` will output 20.
  - Example for Division: `expr 30 / 10` will output 3.
  - Example for Multiplication:
    - The asterisk `*` is a wildcard in Bash.
    - To perform multiplication, you must escape the asterisk with a backslash `\`.
    - Example: `expr 100 \* 4` will output 400.
- You can use variables in your math expressions with expr.
  - Let's say you have a variable `my_num=100`.
  - Add a number to a variable: `expr $my_num + 50` will output 150.

### Modern Approach: Arithmetic Expansion `$((...))`

- This is the modern, preferred standard. It is a shell built-in, making it significantly faster and cleaner than legacy methods.
- **Syntax**: `$(( [expression] ))`
- **Advantages**: No need to escape operators, flexible whitespace, and native variable evaluation.
- Example for Addition: `echo $((30 + 10))` will output 40.
- Example for Subtraction: `echo $((30 - 10))` will output 20.
- Example for Division: `echo $((30 / 10))` will output 3.
- Example for Multiplication: `echo $((100 * 4))` will output 400. (No backslash escape needed for `*`).
- **Variables**: You can use variables directly inside the parentheses without the `$` prefix.
  - Let's say you have a variable `my_num=100`.
  - Add a number to a variable: `echo $((my_num + 50))` will output 150.
- **Direct Evaluation**: Use `((...))` (without the leading `$`) to update variables without outputting a result:
  - Increment: `((my_num++))`
  - Add and assign: `((my_num += 50))`

---

## If Statements

Syntax:

```sh
if [ condition ]
then
    # Commands to execute if true
else
    # Commands to execute if false
fi
```

### Comparison Operators

**Integer Comparison Operators:**

- `-eq`: Equal to.
- `-ne`: Not equal to.
- `-gt`: Greater than.
- `-ge`: Greater than or equal to.
- `-lt`: Less than.
- `-le`: Less than or equal to.

**File and Directory Operators:**

- `-f`: Checks if a file exists and is a regular file.
- `-d`: Checks if a directory exists.

### Negation

You can reverse any check by placing an exclamation mark ! before it.

```sh
if [ ! $mynum -eq 200 ]
then
    echo "The variable is NOT 200."
fi
```

> While this works, it is often cleaner to use the specific operator intended (like -ne for "not equal") instead of negating an "equal" check.

---

## While Loops

The "condition" of while loops is the same as if conditions.

Syntax:

```sh
while [ condition ]
do
    # Commands to execute
done
```

---

## For Loops

Syntax:

```sh
for variable in set
do
    command1
    command2
done
```

### Range Notation

`{start..end}`

```sh
for n in {1..10}
do
    echo $n
    sleep 1
done
```

---

## Exit Codes

- **General Rule**:
  - `0`: Success
  - `1 - 255`: Failure. Any "non-zero" value indicates an error or specific state of termination.
- **Checking the Exit Code**:
  - Bash provides a special environment variable, `$?`
  - It stores the exit code of the _most recently executed command_.
  - Note: Check or store value of `$?` immediately after the command.
  - Common mistake: Run failing command, echo something, then check. It returns the exit code of the echo command, masking the failed command.
- **Custom Exit Code**:
  - Use the `exit` command to terminate a script and manually specify the code it returns to the system.
  - This is useful for passing status information to other scripts or monitoring tools.

```sh
#!/bin/bash

directory="/etc"

if [ -d $directory ]
then
    echo "The directory $directory exists."
    exit 0
else
    echo "The directory $directory doesn't exist."
    exit 199 # Custom error code
fi

ls -l /nonexistent_directory
# Output: ls: cannot access '/nonexistent_directory': No such file or directory
echo $?
# Output: 1 (non-zero code)
```

---

## Script Locations

Storing scripts in your ~/home directory works for personal use, but it has several drawbacks:

- It's not accessible by other users
- You have to type the full path
- As the number of scripts grow, a central system location is more managable

### The Filesystem Hierarchy Standard (FHS)

The FHS defines the purpose of each directory in a Linux distribution. According to this standard:

- `/usr/local/bin`: This is the ideal location for locally installed programs and scripts used by system administrators.
- Benefits: It is _shared_ across the system, and most Linux distributions include this directory in the default command search path.

### Setting Up

- First store the script in `/usr/local/bin`
- Optional but recommended: remove `.sh` extension. It's not required because the shebang `#!/bin/bash` specifies the interpreter. You can just run the script by just typing the script name.
- Change ownership to _root_ so that standard users cannot modify system-level scripts.
- `$PATH` variable allows the shell to know where to find the script command without a full path.
  - Use `which` command to see which file is being executed.
  - To add a custom directory to your search path, use the export command

```sh
export PATH=/your/custom/directory:$PATH
```

---
