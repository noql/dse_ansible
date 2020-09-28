#!/bin/sh

# variable 1= Keyspace name
#
pass=`cat $HOME/.cassandra/.passwd`
datalocation=/data/data/${1}
target_keyspace=$1
src_keyspace=$2
sed -i '1d' ${src_keyspace}_backup
echo "use $target_keyspace;" > ${src_keyspace}_backup1
cat ${src_keyspace}_backup >> ${src_keyspace}_backup1

for i in $(cat /home/cassandra/list_tables_${src_keyspace})
  do
    echo "This is for dev/sys"
    cqlsh -u cassandra -p $pass --ssl -e "drop table $1.$i"
done


