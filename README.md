# learning-shell
## lab1
Write a script in shell language, which displays a list of actions with numbers and waits for the number of the command to be entered, and then starts to execute the commands given in this command.

The script should correctly handle the situation when the input stream ends and allow to work with relative and absolute names of files and directories, which may contain: spaces and tabulation symbols; symbols '*', '?', '[', ']', '-', '~', '$' or consist only of them.

For deletion commands, you must request your own confirmation additionally. The request text must correspond to the system text (output by the rm command). Waiting for the response is on a new line.

Organize error handling, for example, if there is no file to be deleted, for which purpose redirect the output of system error messages to the log file named lab1_err, located in the home directory, and issue its message to the standard error stream. Each input request should be accompanied by a message on a separate line containing information about what data should be entered.

Waiting for input occurs on a new line.

Exiting the script should be done only when the corresponding menu item is selected or the standard input stream is finished. Each argument must be submitted to the program on a separate line.       

**Menu features:**
* Create a directory
* Change the current directory
* Print the contents of the current directory
* Move a file
* Delete the directory with its contents
* Exit the program

## lab2
Write two scripts in shell language, which output lists of:
*(lab2-1.sh)* directory names in the specified directory that have at least one subdirectory. Sort the list by modification time;
*(lab2-2.sh)* groups that have more than the specified number of users.

## lab3
Write two scripts to output:
*(lab3-3.sh)* List of users that are allowed to execute the specified file;
*(lab3-12.sh)* List of directories, in which the specified user has the right to delete files.

All the necessary information must be passed to the script through the command line arguments.
Select all files from the current directory, excluding its subdirectories.
