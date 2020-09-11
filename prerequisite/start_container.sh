#!/bin/bash

#service docker start
#dockerd &> /dev/null &
#service jenkins start
#tail -F /var/log/jenkins/jenkins.log

dockerd &> dockerd-logfile &

su - jenkins
./usr/local/bin/jenkins.sh
