
# https://github.com/docker/docker/issues/9054
cleanup-unused-images (){
    docker rmi $(grep -xvf <(docker ps -a --format '{{.Image}}') <(docker images | tail -n +2 | grep -v '<none>' | awk '{ print $1":"$2 }'))
}

# https://github.com/chadoe/docker-cleanup-volumes
cleanup-volumes (){
    wget https://raw.githubusercontent.com/chadoe/docker-cleanup-volumes/master/docker-cleanup-volumes.sh && sudo bash docker-cleanup-volumes.sh
}

