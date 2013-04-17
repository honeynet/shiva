#!/bin/bash

lamson stop -ALL run
echo
sleep 2

if [ -f ./run/log.pid ]
then
  rm ./run/log.pid
  #echo "log.pid existing"
fi

if [ -f ./run/smtp.pid ]
then
  rm ./run/smtp.pid
  #echo "smtp.pid existing"
fi  

#lamson log - if running, log files get too big in size
lamson start
echo
sleep 1
ps -el | grep -i lamson
echo
netstat -natp

