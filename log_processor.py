#!/usr/bin/python

import sys


print('-'*100)

error_log = sys.argv[1:]


ignore_list = ['wifi error', 'preferred network']
fatal_error = ['quark-agent','redis connectivity']

for log_line in error_log:
	for major_error in fatal_error:
		if major_error in log_line:
			print('\n')
			print('Fatal error found ->', log_line)
			print('.'*100)
	for minor_error in ignore_list:
		if minor_error in log_line:
			print('\n')
			print('Minor error found skipping')
			



