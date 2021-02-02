#!/bin/bash

# Comment blocks

fresh-start_i () {
	case $1 in
		1)
			echo "Config not found, creating sample config..."
			;;
		2)
			echo "Config created using local folder as root folder, execute the script again when ready."
			;;
		3)
			echo "If you wish to do a manual setup for your device - input it now, othervice it will be assumed based on a connected currently phone."
			echo "If you wish to do an automated setup - connect and unlock your device now"
			;;
		*)
	esac
}

# Function blocks

fresh-start () {
	if [[ $(ls | grep "orangefox_build.config") == "" ]]; then { # workdir check
		fresh-start_i 1
		cat > orangefox_build.config << EOL
LOCATION=$PWD
EOL
		fresh-start_i 2
	} fi
	#TODO add mode definition check
	fresh-start_i 3
	mode="auto"
	read -p "Pick a mode [auto]: " tmp
	if [[ "$tmp" != "" ]]; then mode=$tmp; unset tmp ; fi #TODO add input sanitation

}



# Main code

if [[ $# -eq 0 ]]; then { # Check for existing configuration
	fresh-start
} fi

# Temporary
echo $mode 
rm orangefox_build.config