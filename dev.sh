#!/bin/bash

# Which docker image tag we want to use
export IMAGE_VERSION=1.6
export IMAGE=krystian8207/rst:$IMAGE_VERSION

if [[ "$OSTYPE" == "msys" ]]; then
  REPO_HOST_DIR=`pwd -W`
else
  REPO_HOST_DIR=`pwd`
fi

remove_and_stop_rstudio () {
  container_id=$(docker ps -q -a -f name=rstudio)
  container_id_length=${#container_id}
  if [[ $container_id_length > 0 ]]; then
    docker stop rstudio
    docker rm rstudio
  fi
}

echo "Using image $IMAGE"

if [ "$1" == "build" ]; then

  docker build -t $IMAGE .

elif [ "$1" == "pull" ]; then

  docker pull $IMAGE

elif [ "$1" == "push" ]; then

  docker push $IMAGE

elif [ "$1" == "commit" ]; then

  docker commit rstudio krystian8207/rst:$2
  sed -i "4s/.*/export IMAGE_VERSION=$2/" ./dev.sh
  #sed -i "5s/.*/  IMAGE_VERSION: $2/" ./.github/workflows/test.yaml

elif [ "$1" == "run" ]; then

  remove_and_stop_rstudio

  docker run -d --name rstudio -w="/project" -e USERID=$(id -u) -e DISABLE_AUTH=true -p 8787:8787 -v "$REPO_HOST_DIR":/project $IMAGE

  echo "Rstudio running on: http://localhost:8787"
  if [[ "$OSTYPE" == "msys" ]]; then
    start http://localhost:8787 > /dev/null
  else
    xdg-open http://localhost:8787 > /dev/null
  fi

elif [ "$1" == "stop" ]; then

  remove_and_stop_rstudio
  echo "Container stopped and removed"

else
  echo "Usage: ./workflow.sh [param]"
  echo
  echo "Params:"
  echo
  echo "   build - build image from Dockerfile"
  echo "   commit - commit running container into an image"
  echo "   pull - get images from Docker Hub"
  echo "   push - push images to Docker Hub"
  echo "   run - run development image as daemon and start Rstudio in a browser"
  echo "   stop - stop running container"
  echo
fi
