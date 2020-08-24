#!/bin/bash

# stop containers that have been running for more than a day (may not be valid in your context if you intend run things for a long time)
docker ps -a | egrep " days" | awk '{print $1}' | grep -v CONTAINER | xargs docker stop

# remove all exited containers
docker ps -a | egrep "Exited|Created" | awk '{print $1}' | grep -v CONTAINER | xargs docker rm

# remove old images
docker images | egrep 'weeks|months' | awk '{print $1 ":" $2}' | xargs docker rmi -f
docker images | egrep 'weeks|months' | grep '<none>' | awk '{ print $3 }' | xargs docker rmi -f

# kill stray volumes
docker volume ls -qf dangling=true | xargs -r docker volume rm
