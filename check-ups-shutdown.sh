#! /bin/bash

# Tim Trense 2021
# Once shutdownflag is set by upsmon in the container nut-server, shutdown this system and dependent other systems
# This script shall be run by CRON on the docker host

if [ "$(cat /etc/shutdownflag)" != "1" ]
then
  echo "shutdownflag not set"
  exit 0
fi

echo "ups-battery-low $(date) shutdown initiated" > /etc/shutdownflag

echo "shutdownflag set by upsmon. UPS is on battery and low. performing shutdown"
# put shutdown hooks for dependent systems here
echo "shutting down this system in 1 minutes due to UPS battery being low"
shutdown +1 "UPS-battery-low" &
echo "all shutdowns registered."
