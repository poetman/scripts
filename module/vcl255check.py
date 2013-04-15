#!/usr/bin/python
#-*-coding:utf-8 -*-

#add 200 vcl Mac vlan mapping

import netsnmp
from base import *
import random
from scapy.all import *
import time
DUT = "192.168.4.15"
vcl15 = vcl(DUT)

src_b="00:02:03:04:05:"
dest = "12:34:56:78:12:00"

for last in range(1,255,1):
    src_l=src_b+ hex(last)[2:]
    vcl_c = Ether(src=src_l,dst="00:23:32:45:12:33")
    time.sleep(0.5)
    str(vcl_c)
    sendp(vcl_c,iface='eth2')
