#!/bin/sh

a=0
while [ "$a" -lt 10 ] #this is loop1
do 
b="$a"
while [ "$b" -ge 0 ] #this is loop2
do
echo -n "$b "
b=`expr $b - 1`
done
echo
a=`expr $a + 1`
done
echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
do
  echo "Welcome $i times"
done

