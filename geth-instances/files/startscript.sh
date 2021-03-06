#!/bin/sh
cd /root/eth-net-intelligence-api/
/usr/bin/pm2 start app.json
while true
do
if [ ! `pgrep geth` ] ; then
	geth --syncmode "fast" --cache=1024 --rpcvhosts='*' --rpc --rpcapi eth,net,web3 --rpcaddr '0.0.0.0' --rpccorsdomain '*' --txpool.accountslots=256 --txpool.globalslots=20000 --txpool.accountqueue=256 --txpool.globalqueue=20000
fi
sleep 10
done
