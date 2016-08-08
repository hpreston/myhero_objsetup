#!/usr/bin/env bash

echo "Adding $minio_server as host."
./mc config host add myhero $minio_server $minio_access_id $minio_secret S3v4

echo "Creating superheropics bucket."
./mc mb myhero/superheropics

echo "Listing current buckets."
./mc ls myhero

echo "Updating policy on superheropics bucket."
./mc policy download myhero/superheropics

echo "Copying in default images to bucket."
./mc cp /images/* myhero/superheropics/

echo "Listing contents of bucket."
./mc ls myhero/superheropics

echo
echo "All Done"
echo

while [ 10 -ne 11 ]
do
    echo "..."
    sleep 30
done
