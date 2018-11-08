#!/bin/bash

grep -q "^$1" /etc/rsyslog.d/50-default.conf && sed -i "s/^$1/S1/" /etc/rsyslog.d/50-default.conf || echo "$1" >> /etc/rsyslog.d/50-default.conf
