#!/bin/bash
MAILTO=
if [ -e /tmp/bgl-ads-1060/disable.sh ];
then
    if /usr/bin/pgrep -u ngdevx -x telegraf > /dev/null
    then
        /usr/bin/pkill -u ngdevx -x telegraf > /dev/null
    fi
else
    if ! /usr/bin/pgrep -u ngdevx -x telegraf > /dev/null
    then
        /bin/chmod u=rwx -R /tmp/bgl-ads-1060
        (site=BGL dc=BGL11 hostType=ADS-3 hostOs=RHEL7.6 tool=adsrsvp /tmp/bgl-ads-1060/telegraf --config-directory /tmp/bgl-ads-1060 --config /tmp/bgl-ads-1060/telegraf.conf </dev/null >/dev/null &>/dev/null &)
    fi
fi
