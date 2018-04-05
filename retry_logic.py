

MAX_RETRIES = 10
import time 

def some_fnc():
    retry_number = 1
    while True:
        if retry_number == MAX_RETRIES:
            break 
        try:
            retry_number = retry_number + 1
            # Code logic goes here 
            x = 1/0
        except Exception as e:
            print('Retrying number ' +str(retry_number))
            # Wait for 30 sec before retry 
            time.sleep(30)
            continue 
        break

some_fnc()
