#!/bin/bash
set -euo pipefail

mdate=$(date | tr -d [:space:] | tr -d :)   # getting rid of spaces and colons in the date
bpath=$(pwd)/backup_$mdate      # how each backup file will be called
if $(date | grep -q Fri); then      # checks if it is a cerain day of the week by relying on the date command
  echo what should be archived?     # user interaction
  read target                       # declaring a variable for what should be archived
  echo to where?                    # user interaction
  read move                         # declaring a variable for the directory where archive is to be placed
  echo backing up the directory     # user interaction
  $(tar -cf $bpath.tar $target)     # creating the archive
  $(mv $bpath.tar $move)            # moving the archive
else
  echo not Friday                   # if it is not the specified day of the week
fi
