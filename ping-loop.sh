#!/bin/bash

for ip in $(seq  210 220) ;do
ping -c 1 192.168.43.$ip |  grep "bytes from" | cut -d " " -f4 | cut -d ":" -f1 &
//&  is used to limit the process in background used for speeding the process 
done

