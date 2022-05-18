FROM node:16

###########################################################################
# MIRRORS:
###########################################################################

USER root

ARG USE_MIRRORS=false

RUN if [ ${USE_MIRRORS} = true ]; then \
  npm set registry https://registry.npmmirror.com/; \
  npm set disturl https://npmmirror.com/mirrors; \
  npm set electron_mirror https://npmmirror.com/mirrors/electron/; \
  npm set ELECTRON_MIRROR https://npmmirror.com/mirrors/electron/; \
  npm set chromedriver_cdnurl https://npmmirror.com/mirrors/chromedriver; \
  npm set operadriver_cdnurl https://npmmirror.com/mirrors/operadriver; \
  npm set phantomjs_cdnurl https://npmmirror.com/mirrors/phantomjs; \
  npm set selenium_cdnurl https://npmmirror.com/mirrors/selenium; \
  npm set node_inspector_cdnurl https://npmmirror.com/mirrors/node-inspector; \
  yarn config set registry https://registry.npmmirror.com/; \
  yarn config set disturl https://npmmirror.com/mirrors; \
  yarn config set electron_mirror https://npmmirror.com/mirrors/electron/; \
  yarn config set ELECTRON_MIRROR https://npmmirror.com/mirrors/electron/; \
  yarn config set chromedriver_cdnurl https://npmmirror.com/mirrors/chromedriver; \
  yarn config set operadriver_cdnurl https://npmmirror.com/mirrors/operadriver; \
  yarn config set phantomjs_cdnurl https://npmmirror.com/mirrors/phantomjs; \
  yarn config set selenium_cdnurl https://npmmirror.com/mirrors/selenium; \
  yarn config set node_inspector_cdnurl https://npmmirror.com/mirrors/node-inspector; \
fi;

RUN npm i -g npm
RUN npm config set cache /srv/cache/npm-cache --global

RUN rm -rf /usr/local/bin/yarn
RUN rm -rf /usr/local/bin/yarnpkg
RUN rm -rf /opt/yarn-v*
RUN npm i -g yarn
RUN yarn config set cache-folder /srv/cache/yarn-cache

RUN npm i -g pnpm
RUN pnpm config set store-dir /srv/cache/pnpm-store

WORKDIR /srv/services
