#!/bin/bash
set -euo pipefail
shopt -s nocasematch

echo -n "How many files should be created?     "
read number
echo -n "What should their name be?     "
read filename
echo -n "What should their extension be (without a dot)?     "
read extension
echo -n "Logs on (y/n)?     "
read logs

echo "Processing..."
if [ "$logs" == "y" ]
then
        for x in $(seq 1 $number)
        do
                echo "File $filename$x.$extension was successfully created in $(pwd)."
                $(touch $filename$x.$extension)
        done
else
        for x in $(seq 1 $number)
        do
                $(touch $filename$x)
        done
fi
echo "Done!"
