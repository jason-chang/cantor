
ARG NODE_VERSION=20.13
FROM node:${NODE_VERSION}-alpine

USER root

COPY ./mirror.sh /root/mirror.sh

ARG USE_MIRRORS=false
RUN if [ ${USE_MIRRORS} = true ]; then \
  sh ~/.mirror.sh \
fi;

RUN pnpm config set store-dir /srv/cache/pnpm-store
RUN yarn config set cache-folder /srv/cache/yarn-cache
RUN npm config set cache /srv/cache/npm-cache --global

WORKDIR /srv/services
