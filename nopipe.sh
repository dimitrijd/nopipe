#!/bin/bash

#  nopipe -- transform pipe | character in _ in all files of current and sub-dirs     
#  usage:  nopipe [-lrh]

if [ $# = 0 ]; then
      echo $'\n nopipe -h for help \n'; 
fi

while getopts "lrh" opt; do
  case ${opt} in
    l ) # list the files, no action
      find . -name  "*|*" -exec sh -c $'f="{}"; echo "$f"' \; 
      ;;
    r ) # rename the files
      find . -name "*|*"  -exec sh -c $'f="{}"; mv -- "$f" "$(echo "$f" | sed s/\|/_/g)"' \;
      ;;
    h ) # usage 
      echo $'usge:  nopipe [-lrh]' 
      echo $'replace OneDrive forbidden file name character | with _' 
      echo $'all files in the current directory and all its subdirectories are processed'  
      echo $'-l  list files to be renamed' 
      echo $'-r  rename the files'
      echo $'-h  print this message\n'
     ;;      
  esac
done

