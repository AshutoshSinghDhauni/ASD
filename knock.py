#!/usr/bin/python

from itertools import permutations
from socket import *
import sys
import time

server ="192.168.43.207"

s = socket(AF_INET, SOCK_STREAM)
s.connect((server,1337))


data = s.recv(20)
data = data.replace(",","")
ports = data[1:-2].split()

print ports

for iter in permutations(ports, 3):
    for port in iter:
        print "[*] KNOCK KNOCK : " +str(port)
    try:
        s = socket(AF_INET, SOCK_STREAM)
        s.connect((server, int(port)))
        s.close()
    except Exception,e:
        pass
    time.sleep(1)
    print "[-] KNOCK COMPLETE\n"

print "[+] ALL KNOCKING COMPLETE!"


