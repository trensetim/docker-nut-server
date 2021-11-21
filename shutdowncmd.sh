#! /bin/sh -e

# Tim Trense 2021
# Shutdown Command Script
# Executed once "ups.state==BL" (battery low)

echo 1 > /etc/shutdownflag
