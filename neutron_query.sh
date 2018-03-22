host="localhost"
port=7000
echo $host

#Delete if network is existing
curl -X DELETE http://$host:$port/v2.0/networks/8be447f3-2656-4c13-b1ed-e67d84ec91b3 


# Create 0000 network 
echo "####################### Create 0000  Network ####################### "
curl -X POST -H "Content-Type: application/json" -d '{"network": {"id":"00000000-0000-0000-0000-000000000000", "tenant_id": "provider", "name":"public"}}' http://$host:$port/v2.0/networks | jq "."
# Create a network
echo "####################### Creating a Network ####################### "
curl -X POST -H "Content-Type: application/json" -d '{"network": {"id":"8be447f3-2656-4c13-b1ed-e67d84ec91b3", "tenant_id": "provider", "name":"public"}}' http://$host:$port/v2.0/networks | jq "."

# Create subnet in that network
echo "####################### Creating a subnet , within the network #######################"
curl -X POST -H "Content-Type: application/json" -d '{"subnet":{"network_id":"00000000-0000-0000-0000-000000000000","cidr":"10.4.0.0/16", "segment_id":"blah", "tenant_id": "harishupadhyay", "ip_version": "4"}}' http://$host:$port/v2.0/subnets | jq "."

# Create a mac address ranage 

echo "####################### Creating mac address range , inside the network #######################"
curl -X POST -H "Content-Type: application/json" -d '{"mac_address_range": {"cidr" : "AA:BB:CC", "tenant_id": "provider"}}' http://localhost:9696/v2.0/mac_address_ranges.json | jq "."

# Create a port
echo "####################### Creating a port in the subnet, inside the network #######################"
curl -X POST -H "Content-Type:application/json" -d '{"port":{"admin_state_up":true,"name":"port0","tenant_id":"harishupadhyay","network_id":"00000000-0000-0000-0000-000000000000","segment_id":"blah"}}' http://$host:$port/v2.0/ports | jq "."

# Get all ports
echo "####################### List all ports #######################"
curl -X GET http://localhost:$port/v2.0/ports | jq "."


# Create Fixed IP address 
echo "####################### Create Fixed IP Address #######################"
curl -X POST -H "Content-Type:application/json" -d '{"port": { "segment_id":"blah","tenant_id": "provider","admin_state_up": true,"name": "port1","fixed_ips": [{"ip_address": "10.3.0.13","subnet_id": "7aebc226-73d7-4293-99cb-0b04fd6287a0"}],"network_id": "00000000-0000-0000-0000-000000000000"}}' http://$host:$port/v2.0/ports | jq "."

#Shared IP address
#curl -X POST -H "Content-Type:application/json" -d @shared_ip.json http://$host:$port/v2.0/ip_addresses | jq "."
echo "####################### Creating a shared IP within the network #######################"
curl -X POST -H "Content-Type:application/json" -d '{"ip_address":{"network_id": "00000000-0000-0000-0000-000000000000","port_ids":["f035a962-5849-490e-9fae-147337bcb277","e6aba027-2913-4b92-906c-cd6883977f72"],"version": 4,"tenant_id": "harishupadhyay"}}' http://$host:$port/v2.0/ip_addresses | jq "."

# Delete 000 port  
curl -X DELETE http://$host:$port/v2.0/ports/00000000-0000-0000-0000-000000000000 | jq "."


#Delete if network 00000

echo "####################### Delete port 0000  #######################"
curl -X DELETE http://$host:$port/v2.0/networks/00000000-0000-0000-0000-000000000000 
