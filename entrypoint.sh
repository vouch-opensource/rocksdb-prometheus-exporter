#!/usr/bin/env sh

while [ ! -d ${PATHS} ]; do
    echo "Waiting for directories "$PATHS"..."
    sleep 1;
done;

/usr/local/bin/python -u /usr/local/bin/rocksdb-prometheus-exporter \
    --port $PORT \
    --interval $INTERVAL \
    --ttl $TTL \
    $PATHS
