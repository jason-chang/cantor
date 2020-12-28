FROM node:14

###########################################################################
# MIRRORS:
###########################################################################

USER root

ARG USE_MIRRORS=false

RUN if [ ${USE_MIRRORS} = true ]; then \
  npm set registry https://registry.npm.taobao.org; \
  npm set disturl https://npm.taobao.org/dist; \
  npm set sass_binary_site https://npm.taobao.org/mirrors/node-sass; \
  npm set electron_mirror https://npm.taobao.org/mirrors/electron/; \
  npm set ELECTRON_MIRROR https://cdn.npm.taobao.org/dist/electron; \
  npm set puppeteer_download_host https://npm.taobao.org/mirrors; \
  npm set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver; \
  npm set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver; \
  npm set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs; \
  npm set selenium_cdnurl https://npm.taobao.org/mirrors/selenium; \
  npm set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector; \
  yarn config set registry https://registry.npm.taobao.org; \
  yarn config set disturl https://npm.taobao.org/dist; \
  yarn config set sass_binary_site https://npm.taobao.org/mirrors/node-sass; \
  yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/; \
  yarn config set ELECTRON_MIRROR https://cdn.npm.taobao.org/dist/electron/; \
  yarn config set puppeteer_download_host https://npm.taobao.org/mirrors; \
  yarn config set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver; \
  yarn config set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver; \
  yarn config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs; \
  yarn config set selenium_cdnurl https://npm.taobao.org/mirrors/selenium; \
  yarn config set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector; \
fi;

WORKDIR /srv/services
