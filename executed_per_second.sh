#!/bin/bash
for((i=0;i<60;i=(i+2)))
do
  /apin/shell/monitor.sh >> /dev/null
done
