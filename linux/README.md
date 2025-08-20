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

### Common Examples:
- Find by name:
```bash
find /etc -name "nginx.conf"
find /etc -iname "NGinx.conf" # for case insensitive 
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

---
