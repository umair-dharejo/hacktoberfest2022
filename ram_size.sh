#!/bin/bash
TO="123@gmail.com"
ram_size=$(free -mt| grep Total: |awk '{print $4}')

if [ $ram_size -le 15000 ]
then 
 echo "sending mail"
 echo "subject:warning ram is low" | sendmail $TO
 fi

echo "mail sent"
echo "sent via SMTP"

