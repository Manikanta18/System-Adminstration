#!/bin/bash

grep -q "^$1" /etc/rsyslog.d/50-default.conf && sed -i "s/^$1/$1/" /etc/rsyslog.d/50-default.conf || echo "$1        $2" >> /etc/rsyslog.d/50-default.conf
