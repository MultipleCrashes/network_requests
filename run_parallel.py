import subprocess
# Create ports to run in threads
threads = 10
for x in range(1, threads):
    print('No of create port script launched', x)
    subprocess.Popen(['sh', 'create_ports.sh'], stdout=subprocess.PIPE)
