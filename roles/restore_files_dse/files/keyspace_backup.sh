#!/bin/sh
pass=`cat $HOME/.cassandra/.passwd`
keyspace_file=/home/cassandra/${1}_backup
stage_file=/home/cassandra/${1}_stage
data_keyspace_path=/data/data/$1/
#Execute the backup for keyspace
cqlsh -u cassandra -p $pass  --ssl  -e "describe keyspace $1" > ${stage_file}
sed -i "s/${1}.//g" ${stage_file}
#remove a line from the file
sed '1d' ${stage_file}  > ${keyspace_file}
#Cleanup
rm ${stage_file}
cqlsh -u cassandra -p $pass  --ssl  -e "select table_name from system_schema.tables where keyspace_name='${1}'"  > ${stage_file}
sed -e 1d -e 2d -e 3d -e '$d' ${stage_file} > list_tables_${1}
sed -i "s/ //g" list_tables_${1} 
list_tab_seq=`cat list_tables_${1}`
for i in $list_tab_seq
         do
          table_path=`ls -td $data_keyspace_path$i* | head -1`
          echo $table_path 
  done;
