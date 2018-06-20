# local system

from neutron.db import api as ndbapi
from oslo_utils import timeutils
session = ndpapi.get_session()
from quark.db.models import IPAddress
# table to query quark_ip_address 
obj =session.query(IPAddress).filter(IPAddress.address_readable=='10.1.24.133')
current_time = timeutils.utcnow()
session.query(IPAddress).filter(IPAddress.address_readable=='10.1.24.133’).update({IPAddress.deallocated_at:current_time})
