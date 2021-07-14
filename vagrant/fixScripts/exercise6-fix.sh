#!/bin/bash
#add fix to exercise6-fix here
sudo chmod +x exercise6-fix.sh #update execute permissions on file

#write a script that takes a variable number of arguments, with a minimum of 2 argumen
if (( $# < 2 )); then
    echo 'please use at least 2 arguments'
	exit 1
fi

# all arguments except the last are paths to files on the server running the script.

array=( $@ )
len=${#array[@]}
_target=${array[$len-1]}
_args=${array[@]:0:$len-1}
 
#check which server we are on

ip=$(hostname -I | awk '{print $2}')

if [ $ip == 192.168.100.10 ]; then
  home_server=server1
  target_server=server2
else
  home_server=server2
  target_server=server1
fi


# Copy all the received files to the destination path on the other server.

sudo scp $_args vagrant@$target_server:$_target


# the last line of output will print the total number of bytes copied. Please print only the number, without additional text.

total_bytes=$(wc -c --bytes $_args | awk '/total/ {print}' | cut -f1 -d' ') 

echo $total_bytes


