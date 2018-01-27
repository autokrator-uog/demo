
cd event-bus-client-lib
mvn clean package
cp target/eventbusclient-1.0-SNAPSHOT.jar ..
cd ..

mkdir -p accounts-service/include
mkdir -p transaction-service/include
mkdir -p user-service/include

cp eventbusclient-1.0-SNAPSHOT.jar accounts-service/include
cp eventbusclient-1.0-SNAPSHOT.jar transaction-service/include
cp eventbusclient-1.0-SNAPSHOT.jar user-service/include

export COMPOSE="docker-compose -f demo-base.yml \
    \
    -f event-bus/docker/base.yml \
    -f event-bus/docker/event-bus.yml \
    \
    -f accounts-service/docker-compose.yml \
    -f user-service/docker-compose.yml \
    -f transaction-service/docker-compose.yml \
    \
    -f demo-overrides.yml"

$COMPOSE up -d
