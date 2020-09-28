#!/bin/sh

# variable 1= Keyspace name
#
pass=`cat $HOME/.cassandra/.passwd`
 cqlsh -u cassandra -p $pass --ssl -e "${1}"