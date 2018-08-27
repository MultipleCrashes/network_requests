from oslo_service import loopingcall 
from keystoneauth1 import exceptions as keystone_exception
from oslo_utils import excutils


def deallocate_fn():
	print('called deallocate')
	xyz()
	
def xyz():
	raise keystone_exception.connection.ConnectFailure

def test_fn():
    @loopingcall.RetryDecorator(
        max_retry_count=3, inc_sleep_time=2, max_sleep_time=12,
        exceptions=(keystone_exception.connection.ConnectFailure,))
    def _deallocate_network_with_retries():
        try:
            deallocate_fn()
        except keystone_exception.connection.ConnectFailure as e:
            # Provide a warning that something is amiss.
            with excutils.save_and_reraise_exception():
            	print('xyz')

    try:
        _deallocate_network_with_retries()
    except Exception as e:
        print(e)
                

test_fn()