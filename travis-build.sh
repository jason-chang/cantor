#!/usr/bin/env bash

#### halt script on error
set -xe

echo '##### Print docker version'
docker --version

echo '##### Print environment'
env | sort

#### Build the Docker Images
cp env-example .env
sed -i -- 's/=false/=true/g' .env
sed -i -- 's/PHPDBG=true/PHPDBG=false/g' .env

sed -i -- 's/CHANGE_SOURCE=true/CHANGE_SOURCE=false/g' .env

cat .env
docker-compose build ${BUILD_SERVICE}
docker images

#### Generate the Cantor Documentation site using Hugo
if [ -n "${HUGO_VERSION}" ]; then
    HUGO_PACKAGE=hugo_${HUGO_VERSION}_Linux-64bit
    HUGO_BIN=hugo_${HUGO_VERSION}_linux_amd64

    # Download hugo binary
    curl -L https://github.com/spf13/hugo/releases/download/v$HUGO_VERSION/$HUGO_PACKAGE.tar.gz | tar xz
    mkdir -p $HOME/bin
    mv ./${HUGO_BIN}/${HUGO_BIN} $HOME/bin/hugo

    # Remove existing docs
    if [ -d "./docs" ]; then
        rm -r ./docs
    fi

    # Build docs
    cd DOCUMENTATION
    hugo
fi
