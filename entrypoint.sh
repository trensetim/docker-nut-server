#! /bin/sh -e

/usr/sbin/upsdrvctl -u root start
/usr/sbin/upsd -u root
/usr/sbin/upsmon -D
