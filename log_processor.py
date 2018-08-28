#!/usr/bin/python

import sys


print('-'*100)

error_log = sys.argv[1:]


ignore_list = ['wifi error', 'preferred network']

#for element in error_log:
#	print(element)
print('*'*100)
for log_line in error_log:
	for skip_error in ignore_list:
		if skip_error in log_line:
			continue
		else:
			print('\n')
			print('Fatal error found ->', log_line)
			print('.'*100)



