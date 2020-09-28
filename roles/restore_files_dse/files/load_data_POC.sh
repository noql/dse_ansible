#!/bin/sh

pass=`cat $HOME/.cassandra/.passwd`
datalocation=${3}
target_keyspace=$1
src_keyspace=$2
ip_host=`hostname -I`

for i in $(cat /home/cassandra/list_tables_${src_keyspace})
do
echo "find something";
directory_list=`find ${datalocation} -type d -name "${i}_*"`;

#Lets find if the directory exsts
    if [ ! -d ${datalocation}/${i} ] 
     then 
         mkdir ${datalocation}/${i} 
     else
         echo "The directory already exist"
    fi 
# Lets copy the files from the source data files to target load directories
   for j in ${directory_list}
      do 
        cp -rf  $j/* ${datalocation}/${i}/
     echo "sstableloader -d ${ip_host} ${datalocation}/${i}/"
     sstableloader -d ${ip_host}  ${datalocation}/${i}/
      done
done
