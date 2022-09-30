#!/bin/bash
TO="123@gmail.com"
ram_size=$(free -mt| grep Total: |awk '{print $4}')

if [ $ram_size -le 15000 ]

