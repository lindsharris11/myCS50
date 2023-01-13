chmod +x top10.sh

# Prints to stdout a table in Markdown file of the top 10 areas in the US
# to administer vaccines according to the JHU data

# Lindsay Harris
# January 10, 2023



#!/usr/bin/env bash


# creates an error if no file is given as an argument 
FILE=${1?Error:No file given}

# Creates the description for the markdown table 
echo "| Area | Doses administered  |"
echo "| :--------- | --------: |"

# goes through every line in the vaccine_data_us.csv file, takes the top 10 areas in the US to administer all vaccines 
# and puts it and how many vaccines they have addministered and put the data in a markdown table format 
for area in "$(grep -e "All" vaccine_data_us.csv | sort -rnt, -k 10 | head -n 10 | cut -d, -f2-2,10-10 | sed  's/,/|/' | sed 's/^/|/' | sed 's/$/|/')"
    do echo "$area"
done

# exit code if program runs correctly
exit 0 
