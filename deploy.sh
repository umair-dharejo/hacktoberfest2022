#cd /home/ubuntu/backend-services/
#git checkout $BRANCH
#git checkout -f
#git pull origin $BRANCH
#mvn clean install -DskipTests
#sudo fuser -k $PORT/tcp
#sudo nohup java -jar -DXms$XMS -Xmx$XMX -DPASSWORD=$PASSWORD  -Dspring.profiles.active=$ACTIVE_PROFILE -DPORT=$PORT -DLOGSTASH_ENABLED=$LOGSTASH_ENABLED -DLOGSTASH_HOST=$LOGSTASH_HOST -DLOGSTASH_PORT=$LOGSTASH_PORT -DZIPKIN_ENABLED=$ZIPKIN_ENABLED -DZIPKIN_HOST=$ZIPKIN_HOST -DZIPKIN_PORT=$ZIPKIN_PORT -DMETRICS_ENABLED=$METRICS_ENABLED -DREGISTRY_HOST=$REGISTRY_HOST -DREGISTRY_PORT=$REGISTRY_PORT -Duser.timezone=GMT+05 postex-services.jar > /dev/null 2>&1 &
containerID=$(docker ps | grep "$ECR/$IMAGE_NAME" | awk '{print $1}');
#images=$(docker images | grep "$ECR/$IMAGE_NAME" | awk '{print $1":"$2}')
CONTAINER_NAME=postex-notifications-ms

docker ps -q --filter name=$CONTAINER_NAME | grep -q . && docker stop $CONTAINER_NAME  && docker rm -fv $CONTAINER_NAME || echo Not Found;docker ps -a -q --filter name=$CONTAINER_NAME | grep -q . && docker rm -fv $CONTAINER_NAME;

docker run -e JAVA_OPTS="-Xms$XMS -Xmx$XMX -DPASSWORD=$PASSWORD  -Dspring.profiles.active=$ACTIVE_PROFILE -DPORT=$PORT -DLOGSTASH_ENABLED=$LOGSTASH_ENABLED -DLOGSTASH_HOST=$LOGSTASH_HOST -DLOGSTASH_PORT=$LOGSTASH_PORT -DZIPKIN_ENABLED=$ZIPKIN_ENABLED -DZIPKIN_HOST=$ZIPKIN_HOST -DZIPKIN_PORT=$ZIPKIN_PORT -DMETRICS_ENABLED=$METRICS_ENABLED -DREGISTRY_HOST=$REGISTRY_HOST -DREGISTRY_PORT=$REGISTRY_PORT -Duser.timezone=GMT+05" -d --restart=always -p $PORT:$PORT --network=host --name=$CONTAINER_NAME $ECR/$IMAGE_NAME:$BITBUCKET_COMMIT

echo 'Y' | docker image prune -a;

