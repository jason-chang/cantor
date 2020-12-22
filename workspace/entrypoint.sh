#!/bin/bash

chmod -R 644 /etc/cron.d;
service cron restart

# keep container life
tail -f /dev/null
