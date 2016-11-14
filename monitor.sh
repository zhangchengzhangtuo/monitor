#!/bin/bash
executed_flag="executed"
date=`date "+%Y_%m_%d_%H_%M_%S"`
number=`netstat -anp | grep 8080 | wc -l`
base_dir="/apin/shell/"
if [ $number -eq 0 ] && [ ! -f "${base_dir}$executed_flag" ]
then
   touch "${base_dir}$executed_flag" 
   top_file_name=$date"_top"
   top  -b -d 1 -n 1   >> "${base_dir}$top_file_name"
   iostat_file_name=$date"_iostat"
   iostat -x >> "${base_dir}${iostat_file_name}"
   tcp_file_name=$date"_tcp"
   netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' >>"${base_dir}${tcp_file_name}"
   vmstat_file_name=$date"_vmstat"
   vmstat >> "${base_dir}${vmstat_file_name}"
   free_file_name=$date"_free"
   free -m >> "${base_dir}${free_file_name}"
fi
