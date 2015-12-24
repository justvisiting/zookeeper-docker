docker build -t nano/zookeeper .
ID=$(docker build -t nano/zookeeper .) # This build and tag the image with creack/node:latest
docker tag $ID nano/zookeeper:1.0  # Add a new tag
docker tag $ID nano/zookeeper:latest   # You can use this and skip the -t part from build
