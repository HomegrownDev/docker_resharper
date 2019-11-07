#!/bin/bash
eval $(/usr/resharper/bin/license-server.sh start) 

while [[ $(/usr/resharper/bin/license-server.sh status) == *"JetBrains License Service is running"* ]]; do 
    echo "ReSharper is Running"
    sleep 15
done

if [[ $(/usr/resharper/bin/license-server.sh status) == *"JetBrains License Service is shut down"* ]]; then
	eval $(/usr/resharper/bin/license-server.sh stop)
	echo "JetBrains License Service is now shut down"
fi