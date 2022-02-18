#!/bin/sh
if [ ! -d "/data/arweave" ];then
  mkdir /data/arweave
fi
epmd -daemon && \
./bin/start init data_dir /data/arweave \
            requests_per_minute_limit 9999999999999999999999999999999999999999 \
            disk_space 100000000 \
            max_disk_pool_data_root_buffer_mb 100 \
            tx_propagation_parallelization 3 \
            max_emitters 1 \
            enable arql_tags_index \
            enable serve_tx_data_without_limits \
            port 1984