#!/bin/sh
while true
do
  r=$(curl -s -H "X-Network: arweave.testnet" "arweave-node:1984/tx/ready_for_mining")
  if [ "$r" != "[]" ];then
    curl -s -H "X-Network: arweave.testnet" -X POST "arweave-node:1984/mine"
    sleep 15
    else
    sleep 3
  fi
done