chmod +x summarize.sh

# Summarizing Files:
# This script takes in 0-n number of file names as arguments
# and prints a markdown format of the continuous lines of the files and denotes the language

# Lindsay Harris, January 10, 2023



#!/usr/bin/env bash

# checks if a file was passed in 
FILE=${1?Error:No file given}


# goes through all the files passed in as arguments 
for file in "$@";do

    # checks if the file is readable and not a directory 
    if [[ -f $file ]]; then 

        # checks that the file is a bash script or a c file 
        if [[ $file == *".sh" ]] || [[ $file == *".h" ]] || [[ $file == *".c" ]]; then
            
            # sets the variable end equal to "bash" for bash files 
            if [[ $file == *".sh" ]]; then
                end="bash"
            else

                # sets the variable end equal to "c" for c files
                end="c"
            fi
            
            # gets just the pathname of the file 
            justName=$(basename $file)

            # prints the pathname of the file as a subheader in markdown format 
            echo "## " $justName
            
            # starts the triple tick format and prints the file type 
            echo '```'$end
        
            # goes through every line of the file, removes "!#" if the file starts with that, 
            # prints the remaining lines, and finds the first blank line, removes it, 
            # and removes all the text after it
            sed -e '/^#!/d' -e '/^$/,$d' $file

            # closes triple tick notation  
            echo '```' 
            
        else
            continue
        fi
            
            
    else
        # if the file is not readable, print to a standrad error file 
        echo "pathname does not refer to a readable file" >> /dev/stderr
        
        # exit code if program doesn't run correctly
        exit 1
    fi
done

# exit code if program runs correctly
exit 0 