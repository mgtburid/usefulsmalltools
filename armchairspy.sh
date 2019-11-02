#!/bin/bash
# not using set -euo pipefail because it will not allow script to work
# if there is a need to send this script into background, just add & in the end
# be aware that if you put an interval to 2 seconds and accidentaly told bash
# to run the script, you may not be able to stop it without killing the process
# or first bringing it to the foreground and exiting it

function dwnld {
	$(wget -mkEpnp -e robots="off" $1)              # saving target
  name=$(echo $1 | cut -d "/" -f3)                # getting name of the folder
  mv ./$name ./$name"_"$(date "+%d%b%Y%a%H%m%S")  # replacing previous name with the one with date
}

while [[ $# -gt 0 ]]; do
	case $1 in	# checks positional parameters
		-s | --second)
			shift		# going for the first parameter's value
			[[ -z $2 ]] && echo "No link provided. Exiting." && break
			if [[ $2 != "http"* ]]; then	 # makes sure target meets all criteria
				echo "Something is wrong. Link should be in the form of http[s]://whatever."
				break
			else
				while true; do
					dwnld "$2"	# mainly used function
					sleep $1
				done
				shift
			fi
			;;
		-m | --minute)
			shift
			[[ -z $2 ]] && echo "No link provided. Exiting." && break
                        if [[ $2 != "http"* ]]; then
                                echo "Something is wrong. Link should be in the form of http[s]://whatever."
                                break
                        else
				while true; do
					dwnld "$2"
					sleep $(($1*60))	# 60 seconds = 1 minute
				done
				shift
			fi
			;;
		-h | --hour)
			shift
			[[ -z $2 ]] && echo "No link provided. Exiting." && break
                        if [[ $2 != "http"* ]]; then
                                echo "Something is wrong. Link should be in the form of http[s]://whatever."
                                break
			else
				while true; do
					dwnld "$2"
					sleep $(($1*3600))	# 3600 seconds = 1 hour
				done
				shift
			fi
			;;
		--help)
			echo "This tool will help you spy on somebody on the Internet (or simply not miss some important event) by saving a webpage you need every provided interval. The program is using wget to download pages so make sure it is available on your machine."
			echo "-s or --second for an interval in seconds."
			echo "-m or --minute for an interval in minutes."
			echo "-h or --h for an interval in minutes."
			break
			;;
		*)
			echo "No such feature."
			;;
	esac
done
