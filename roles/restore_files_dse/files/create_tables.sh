#!/bin/sh

# variable 1= Keyspace name
#
pass=`cat $HOME/.cassandra/.passwd`
#tables_list=`cat $HOME/list_tables_dev_item`
target_keyspace=$1
src_keyspace=$2


#Create all the tables that we are dropping
echo "Creating the tables"

cqlsh -u cassandra -p $pass --ssl -f "${src_keyspace}_backup1"

