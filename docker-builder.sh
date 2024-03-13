#!/bin/env bash

usage() {
cat << EOF
USAGE: $0 POSITIONAL

This script will clean old build to help you start anew

POSITIONAL
PROJECT_NAME    enter the name of the you want to use for your image and container for this project

Exemple:

$0 django-app
EOF
}

cat << EOF
Disclaimer this is a container for development pupose :
  - start it
  - import your source to be reachable by vscode
  - go inside and start your django server
        * [python ]manage.py runserver
  - edit your source
EOF

if [ $# -eq 0 ] || [ $# -gt 1 ]
then
    usage
    exit 1
fi

case $1 in
    -h|--h*) usage; exit 0
            ;;
    *) # TODO test if it's a string before setting the app var
        app=$1
        ;;
esac

if [ $(docker container ls -a | grep -i up | grep $app | wc -l) -gt 0 ]
then
    echo "Stoping containers $app"
    docker stop $(docker container ls -a | grep $app)
fi

if [ $(docker container ls -a | grep -vi up |  grep $app | wc -l) -gt 0 ]
then
    echo "Removing containers $app"
    docker rm $(docker container ls -a | grep $app)
fi

echo "building app $app"
docker build . -t $app:0.1

if [ $? -eq 1 ]
then
    exit 1
fi

echo "starting app"
docker compose up -d