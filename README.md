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
