#!/usr/bin/env bash

echo "Start mysql..."
/entrypoint.sh mysqld --user=mysql &

while ! bash -c "echo > /dev/tcp/localhost/3306" &> /dev/null ; do
    echo "...waiting for mysql..."
    sleep 2
done

exec "$@"