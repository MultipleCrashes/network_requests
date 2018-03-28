import subprocess
# Create ports to run in threads
threads = 5
for x in range(1, threads):
    print('No of create port script launched', x)
    p = subprocess.Popen([ './create_ports.sh'])
