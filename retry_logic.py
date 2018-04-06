

MAX_RETRIES = 3
import time 

def some_fnc():
    delay = 30
    retry_count = 1
    while True:
        if retry_count == MAX_RETRIES:
            break 
        try:
            retry_count = retry_count + 1
            # Code logic goes here 
            x = 1/0
        except Exception as e:
            print('Retrying number ' +str(retry_count))
            # Delay before retry 
            delay = delay + delay
            print('Delay', delay)
            delay = delay * retry_count
            time.sleep(delay)
            continue 
        break

some_fnc()
