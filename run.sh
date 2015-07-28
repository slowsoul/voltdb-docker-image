#!/bin/bash

function help() {
    echo "Usage: ./run.sh <image name> <container name>"
}

if [ $# -ne 2 ]; then help; exit; fi;

USER=`ls -ld $VOLTPATH | cut -d ' ' -f 3`
GROUP=`ls -ld $VOLTPATH | cut -d ' ' -f 4`
CMD="voltdb create"

docker run -d -P --name $2 $1 \
sh -c "groupadd $GROUP;useradd $USER -m -g $GROUP;chown -R $USER:$GROUP /opt /tmp /home/$USER;
echo 'export PATH=\$PATH:/opt/voltdb/bin;cd /home/$USER;$CMD' | su - $USER;"

sleep 5

docker exec -i -t -u $USER $2 bash

