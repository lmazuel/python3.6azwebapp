#!/usr/bin/env bash
service ssh start

touch /home/LogFiles/python_${WEBSITE_ROLE_INSTANCE_ID}_out.log
echo "$(date) Container started" >> /home/LogFiles/python_${WEBSITE_ROLE_INSTANCE_ID}_out.log

# Should be outside in a "startup.sh" file

pip install flask >> /home/LogFiles/python_${WEBSITE_ROLE_INSTANCE_ID}_out.log
python /home/site/wwwroot/app.py
