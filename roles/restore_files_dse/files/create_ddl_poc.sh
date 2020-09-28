#!/bin/sh

# variable 1= Keyspace name
#
pass=`cat $HOME/.cassandra/.passwd`
datalocation=/data3/data/${1}
#tables_list=`cat $HOME/list_tables_dev_item`
target_keyspace=$1
src_keyspace=$2
sed -i '1d' {{ src_keyspace }}_backup
echo "use $target_keyspace;" > {{ src_keyspace }}_backup1
cat dev_item_backup >> {{ src_keyspace }}_backup1



for i in $(cat /home/cassandra/list_tables_${{ src_keyspace }})
  do
    echo "cqlsh 10.35.80.98 -e "drop table $1.$i""
    cqlsh 10.35.80.98 -e "drop table $1.$i"
done


