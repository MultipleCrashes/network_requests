

MAX_RETRIES = 10

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
            continue 
        break

some_fnc()
