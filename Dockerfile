FROM python:3.9.11-alpine3.14

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

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
