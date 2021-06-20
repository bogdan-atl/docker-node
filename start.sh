#!/usr/bin/env bash


FILE=/app/idena/idena-node 
if [ -f "$FILE" ]; then 
echo "$FILE on" 
else 
wget -O /app/idena/idena-node https://github.com/idena-network/idena-go/releases/download/v${VER}/idena-node-linux-${VER} 
echo "$FILE set" 
fi

FILE=/app/idena/datadir/idenachain.db/LOG
if [ -f "$FILE" ]; then 
    echo "$FILE on" 
else 
    wget -O idenachain.db.zip https://sync.idena.site/idenachain.db.zip
    unzip /app/idena/idenachain.db.zip -d /app/idena/datadir/idenachain.db/
    echo "$FILE set"
    rm /app/idena/idenachain.db.zip
fi


 
    
FILE=/app/idena/datadir/keystore
if [ -f "$FILE" ]; then
    echo "$FILE on "
else 
    mkdir  datadir/keystore
    echo "$FILE create "
fi
 

FILE=/app/idena/datadir/api.key
if [ -f "$FILE" ]; then
    echo "$FILE on "
else 
    touch datadir/api.key
    echo "$FILE set "
fi




if [ -z "$NODE_KEY" ]
then
   echo "The variable NODE has nothing in it."\
   
   
elif ! [ -z "$NODE_KEY" ]
then
   touch datadir/keystore/nodekey
   echo ${NODE_KEY}  > datadir/keystore/nodekey
   echo "The variable NODE  has something in it."
fi





echo ${API_KEY}  > datadir/api.key



echo ${CONF} | sed -e "s/^.//;s/.$//" > /app/idena/config.json


chmod +x /app/idena/idena-node

/app/idena/idena-node --config /app/idena/config.json
