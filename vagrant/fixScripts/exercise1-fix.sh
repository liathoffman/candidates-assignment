#!/bin/bash
#add fix to exercise1 here

sudo route del -net www.textfiles.com netmask 255.255.255.255 dev eth0
