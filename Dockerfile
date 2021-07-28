FROM python:3.9-alpine

MAINTAINER nicolas@movio.co

WORKDIR /app

COPY rocksdb_prometheus_exporter/*.py /app/rocksdb_prometheus_exporter/
COPY setup.py /app/
COPY LICENSE /app/

RUN pip install -e .

ENV PORT 8080
ENV INTERVAL 15
ENV TTL 60
ENV PATHS /stores/

CMD python -u /usr/local/bin/rocksdb-prometheus-exporter \
    --port $PORT \
    --interval $INTERVAL \
    --ttl $TTL \
    $PATHS
