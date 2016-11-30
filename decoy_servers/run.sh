#!/bin/sh

for i in 1 2 3 4
do
nginx -p . -c nginx$i.conf &
done

jobs
