#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR/.."

bin/check-nofile

RANDOMX_JIT="disable randomx_jit"

export ERL_EPMD_ADDRESS=127.0.0.1
export NODE_NAME='arweave@127.0.0.1'

while true; do
    echo Launching Erlang Virtual Machine...
    if
        "bin/arweave" foreground +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low +Bi -run ar main $RANDOMX_JIT "$@"
    then
        echo "Arweave Heartbeat: Server terminated safely."
        exit 0
    else
        echo "Arweave Heartbeat: The Arweave server has terminated. It will restart in 15 seconds."
        echo "Arweave Heartbeat: If you would like to avoid this, press control+c to kill the server."
        sleep 15
    fi
done