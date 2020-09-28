#!/bin/sh

pass=`cat $HOME/.cassandra/.passwd`
datalocation=/data/data/${1}
stage_dir=/data/${1}
target_keyspace=$1
src_keyspace=$2
sed -i '1d' dev_item_backup
echo "use $target_keyspace;" > dev_item_backup1
cat dev_item_backup >> dev_item_backup1


#Execute the backup for keyspace
#cqlsh -u cassandra -p $pass  --ssl  -e "describe keyspace $1" > ${stage_file}
#Create the ddl for the tables that we are restoring

#cqlsh 10.35.80.98 -f "${1}_backup"


for i in $(cat /home/cassandra/list_tables_${src_keyspace})
       do 
        echo "Deleting the directory of table $datalocation/${i}-*"
        rm -R $datalocation/${i}-*             
done

#Delete any staged directory
for i in $(cat /home/cassandra/list_tables_${src_keyspace})
       do
        echo "Deleting the directory of table $datalocation/${i}"
        rm -R $datalocation/${i}
done

#Delete any staged directory
for i in $(cat /home/cassandra/list_tables_${src_keyspace})
       do
        echo "Deleting the directory of table $datalocation/${i}_*"
        rm -R $datalocation/${i}_*
done

for i in $(cat /home/cassandra/list_tables_${src_keyspace})
       do
        echo "Deleting the directory of table $datalocation/${i}_*"
        rm -R ${stage_dir}/${i}_*
done


