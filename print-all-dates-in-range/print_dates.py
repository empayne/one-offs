#!/usr/bin/env python
from datetime import datetime
from datetime import timedelta
import sys

time_format = "%Y-%m-%d" # eg. 1999-12-26
current = datetime.strptime(sys.argv[1], time_format)
end = datetime.strptime(sys.argv[2], time_format)

while current <= end:
    print(current.strftime("%a %B %d %Y"))
    current = current + timedelta(days=1)
