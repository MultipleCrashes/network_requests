#!/usr/bin/env bash 
host="localhost"
port=9696

for number in {1..100000}
do
curl -X POST -H "Content-Type:application/json" -d '{"port":{"admin_state_up":true,"name":"port0","tenant_id":"harishupadhyay","network_id":"00000000-0000-0000-0000-000000000000","segment_id":"blah"}}' http://$host:$port/v2.0/ports | jq "."
done
exit 0

