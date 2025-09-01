# Stop and remove container

source .env.network
source .env.volume
source .env.db

if [ "$(docker ps -aq -f name=$DB_CONTAINER_NAME)" ]; then
    echo "removing $DB_CONTAINER_NAME."
    docker kill $DB_CONTAINER_NAME 
else
    echo " Container $DB_CONTAINER_NAME not exist, skipping container removal"
fi


if [ "$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
    echo "Removing volume $VOLUME_NAME"
    docker volume rm $VOLUME_NAME
else
    echo "volume $VOLUME_NAME not exists, skipping volume removal"
fi

if [ "$(docker network ls -q -f name=$NETWORK_NAME)" ]; then
    echo "Removing volume $VOLUME_NAME"
    docker network rm $NETWORK_NAME
else
    echo "Network $NETWORK_NAME not exist, skipping network removal"
fi