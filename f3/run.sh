#!/bin/bash
MAILTO=
if [ -e /tmp/rcb-cncopy-nigoyal-02/disable.sh ];
then
    if /usr/bin/pgrep -u ngdevx -x telegraf > /dev/null
    then
        /usr/bin/pkill -u ngdevx -x telegraf > /dev/null
    fi
else
    if ! /usr/bin/pgrep -u ngdevx -x telegraf > /dev/null
    then
        /bin/chmod u=rwx -R /tmp/rcb-cncopy-nigoyal-02
        (site=BGL dc=BGL11 hostType=BM-UCS-1 hostOs=RHEL7.5 tool=cncopy /tmp/rcb-cncopy-nigoyal-02/telegraf --config-directory /tmp/rcb-cncopy-nigoyal-02 --config /tmp/rcb-cncopy-nigoyal-02/telegraf.conf </dev/null >/dev/null &>/dev/null &)
    fi
fi
