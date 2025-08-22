# linux-documentation

# Linux Commands Cheat Sheet

## 1. `cal`
Used to display a calendar.

---

## 2. `history`
Shows the list of previously executed commands.

---

## 3. `!<number>`
Runs the command at the specified history index.  
**Example:** `!2` executes the second command from the history list.

---

## 4. `!!`
Repeats the last command from the history.

---

## 5. `which <command>`
Shows the location of the executable file associated with the command.  
**Example:** `which ls`

---

## 6. `tty`
Displays the file name of the terminal connected to standard input.

---

## 7. `cut`

### Syntax and Examples:
- `cut -b 1-7 example.txt` → cuts based on byte range
- `cut -c 1-7 example.txt` → cuts based on character range
- `cut -d " " -f 1 example.txt` → cuts based on delimiter and field number

### Flags:
- `-b` (bytes): Counts and extracts based on byte size (important for UTF-8 and multi-byte characters).
- `-c` (characters): Extracts based on character position.
- `-d` (delimiter), `-f` (field): For field extraction.

---

## 8. `tee`

### Main Use Cases:
- View command output while also saving it to a file.
- Useful for logging or debugging pipelines.

---

## 9. `alias`

### 1. Temporary alias (current session only)
```bash
alias ll='ls -la'
```
Now `ll` runs `ls -la`.

### 2. Permanent alias (user-specific)
Add the alias to your shell config file (e.g., `~/.bashrc` for Bash):
```bash
alias gs='git status'
```
Reload with:
```bash
source ~/.bashrc
```

### 3. System-wide alias (for all users)
Edit:
```bash
/etc/bashrc
```

---

## 10. `locate`

### How it Works:
- Uses a prebuilt database (updated via `updatedb`).
- Very fast because it doesn’t touch the actual file system.

### Usage:
```bash
locate nginx.conf
sudo updatedb  # to refresh the database
```

---

## 11. `find`

### Description:
Performs real-time, flexible search through the file system.

### Examples:
- Find by name:
```bash
find /etc -name "nginx.conf"

```
- Case-insensitive search:
```bash
find . -iname "*.jpg"
```
- By size:
```bash
find / -size +100M
```
- By modification time:
```bash
find /tmp -mtime -1
```
- By permission:
```bash
find / -perm 0777
```
- Delete all `.log` files:
```bash
find /var/log -name "*.log" -delete
```
- Execute with another command:
```bash
find . -name "*.sh" -exec chmod +x {} \;
```
- Combined with `xargs`:
```bash
find . -name "*.log" -print0 | xargs -0 rm
```
- Combined with `exec`:
```bash
find . -maxdepth 1 -type f -size +0k -exec cp {} ./hey \;
```

## 12. `cat` (Concatenate and Display)
- **Purpose**: Displays the content of a file or concatenates multiple files.
- **Usage**:
  ```bash
  cat file.txt
  cat file1.txt file2.txt > combined.txt
  ```
- **Example**:
  ```bash
  cat hello.txt
  ```
  Output:
  ```
  Hello World
  ```

---

## 13. `tac` (Reverse `cat`)
- **Purpose**: Displays the contents of a file **in reverse order (line by line)**.
- **Usage**:
  ```bash
  tac file.txt
  ```
- **Example**:
  ```bash
  cat lines.txt
  ```
  ```
  line1
  line2
  line3
  ```
  ```bash
  tac lines.txt
  ```
  Output:
  ```
  line3
  line2
  line1
  ```

---

## 14. `rev` (Reverse Characters)
- **Purpose**: Reverses each line of text, character by character.
- **Usage**:
  ```bash
  rev file.txt
  ```
- **Example**:
  ```bash
  cat hello.txt
  ```
  ```
  Hello
  World
  ```
  ```bash
  rev hello.txt
  ```
  Output:
  ```
  olleH
  dlroW
  ```

---

## 15. `head`
- **Purpose**: Displays the **first N lines** of a file (default = 10 lines).
- **Usage**:
  ```bash
  head file.txt
  head -n 20 file.txt   # show first 20 lines
  head -c 50 file.txt   # show first 50 characters
  ```
- **Example**:
  ```bash
  cat sample.txt
  ```
  ```
  line1
  line2
  line3
  line4
  line5
  line6
  ```
  ```bash
  head -n 3 sample.txt
  ```
  Output:
  ```
  line1
  line2
  line3
  ```

---

## 16. `tail`
- **Purpose**: Displays the **last N lines** of a file (default = 10 lines).
- **Usage**:
  ```bash
  tail file.txt
  tail -n 15 file.txt   # show last 15 lines
  tail -f logfile.log   # follow file in real-time
  ```
- **Example**:
  ```bash
  cat sample.txt
  ```
  ```
  line1
  line2
  line3
  line4
  line5
  line6
  ```
  ```bash
  tail -n 2 sample.txt
  ```
  Output:
  ```
  line5
  line6
  ```

---

## 17. `sort`
- **Purpose**: Sorts the contents of a file or input text line by line.
- **Usage**:
  ```bash
  sort file.txt
  ```

###  Important Options for sort
1. **`-r`** → Reverse the sorting order (descending).  
   ```bash
   sort -r file.txt
   ```
2. **`-n`** → Sort numerically (instead of alphabetically).  
   ```bash
   sort -n numbers.txt
   ```
3. **`-u`** → Remove duplicates (unique results only).  
   ```bash
   sort -u file.txt
   ```
4. **`-k`** → Sort based on a specific column/field.  
   ```bash
   sort -k 2 file.txt
   ```
5. **`-t`** → Define a custom delimiter (default = space/tab).  
   ```bash
   sort -t "," -k 2 file.csv
   ```

- **Example**:
  ```bash
  cat names.txt
  ```
  ```
  Bob
  Alice
  Charlie
  Alice
  ```
  ```bash
  sort -u names.txt
  ```
  Output:
  ```
  Alice
  Bob
  Charlie
  ```

---


---
