#!/bin/bash

HOST="8.8.8.8"
LOG_PATH="/var/log/nginx/old.log"
HINT_HOST="hint.macpaw.io"

# Find second number
headers=`curl -I ${HINT_HOST}`
etag=`echo "${HEADERS}" | grep -oP 'ETag: "\d{2}'`

# Find third number
statuses=`grep -oP "status=[[:digit:]]*" ${LOG_PATH}`
uniq_statuses=`echo ${statuses} | grep "[[:digit:]]*" | sort | uniq -c`
cmn_status=`echo ${uniq_statuses} | sort -nr | sed -n 2p`

n1=`grep -o "remote_addr=${HOST}" "${LOG_PATH}" | wc -l`
n2=${etag: -2}
n3=${cmn_status: -3}

password=$(( ${n1} + ${n2} + ${n3} ))

echo ${password}

unzip -P ${password} '/tmp/additional.zip'
