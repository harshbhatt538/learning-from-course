1. cal :- use to see calander

2. history

3. !no. :- for example: !2 this will run index no. 2 command of history command list

4. !! :- this runs list command listed in history command

5. which (command) :- for example: which ls this will show ls commands code is in which location

6. tty :- The primary output is the path to the terminal device file

7. cut :- cut -b 1-7 example.txt :- cuts from byte cut -c 1-7 example.txt :- cuts from character cut -d " " -f 1 example.txt :- cuts from the field

-b (bytes): Counts and extracts based on the actual byte size of each character, which can differ for multi-byte characters like those found in UTF-8. -c (characters): Counts and extracts based on the number of characters, considering each character as a unit, regardless of its byte size.


8. tee :- 
Main Use Cases:

View the output of a command on the terminal while also saving it to a file.
Useful in logging or debugging pipelines.


9. Alias
  1. Temporary alias (only for current shell session)
  using the alias command:
  
  alias ll='ls -la'
  
  
  Now typing ll will execute ls -la.

  This alias will disappear when you close the terminal.
  
  2. Permanent alias (user-specific)
  To make the alias permanent, you need to add it to a shell configuration file.
  
  For Bash → add to ~/.bashrc
  
  
  Example (inside ~/.bashrc):
  
  alias gs='git status'
  
  
  After saving, reload with:
  
  source ~/.bashrc
  
  3. System-wide alias (all users)
  If we want the alias to be available to every user on the system, add it to:
  
  /etc/bashrc

10. locate 
  How it works:
  
  Uses a prebuilt database (via updatedb)
  
  Fast because it doesn’t touch the actual file system
  
  Basic Usage:
  locate nginx.conf
  
  Refresh database manually:
  sudo updatedb

11. Find 
  find Real-Time, Filtered Search
  
  
  How it works:
  
  Scans the actual file system
  Slower but 100% accurate and flexible
  
  find <path> <criteria> <action>
  
  Find by name :-
  find /etc -name “nginx.conf”
  	
  Case-insensitive :- 
  find . -iname "*.jpg"
  
  By size                   
  find / -size +100M
  
  By time                 
  find /tmp -mtime -1  (modified in last 1 day) 
  
  By permission             
  find / -perm 0777
  
  Delete all `.log` files   
  find /var/log -name "*.log" -delete
  
  Exec with another command 
  find . -name "*.sh" -exec chmod +x {} \
  
  Example:-
  find . -name "*.log" -print0 | xargs -0 rm
  
  	
  	
