#!/bin/sh
pass=`cat $HOME/.cassandra/.passwd`
cqlsh -u cassandra -p $pass  --ssl  -e "describe schema" > _Schema_dse
