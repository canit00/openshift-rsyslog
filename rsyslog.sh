#!/bin/sh
# Wrapper to start rsyslog.d with appropriate sysconfig options.

# Set the nodename in /etc/rsyslog.conf so that the destination receives logs with the actual hostname, and not the pod's.
sed -i "1s/^/\$LocalHostName ${MY_NODE_NAME}\n/" /etc/rsyslog.conf

source /etc/sysconfig/rsyslog
exec /usr/sbin/rsyslogd -n $SYSLOGD_OPTIONS
