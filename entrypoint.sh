#! /bin/bash -e

echo "container start initiated"
echo "resetting /etc/shutdownflag"
echo "0" > /etc/shutdownflag

stop() {
  echo "container stop initiated"
  echo "stopping upsmon"
  /usr/sbin/upsmon -c stop
  echo "stopping upsd"
  /usr/sbin/upsd -u root -c stop
  echo "stopping upsdrvctl"
  /usr/sbin/upsdrvctl -u root stop
  echo "stop completed"
}
echo "registering signal trap"
trap 'stop' SIGTERM
trap 'stop' SIGINT

echo "starting upsdrvctl"
/usr/sbin/upsdrvctl -u root start
echo "starting upsd"
/usr/sbin/upsd -u root &
echo "starting upsmon"
/usr/sbin/upsmon -D
