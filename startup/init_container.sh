#!/usr/bin/env bash
service ssh start

touch /home/LogFiles/python_${WEBSITE_ROLE_INSTANCE_ID}_out.log
echo "$(date) Container started" >> /home/LogFiles/python_${WEBSITE_ROLE_INSTANCE_ID}_out.log

