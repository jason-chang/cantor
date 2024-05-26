#!/usr/bin/env bash

package_managers=(
  "npm"
  "yarn"
  "pnpm"
)

# Set the registry for all package managers
for package in "${package_managers[@]}"; do
  echo "Setting registry for $package"
  $package config set registry https://registry.npm.taobao.org
  $package config set disturl https://npmmirror.com/mirrors
  $package config set electron_mirror https://npmmirror.com/mirrors/electron/ 
  $package config set ELECTRON_MIRROR https://npmmirror.com/mirrors/electron/
  $package config set chromedriver_cdnurl https://npmmirror.com/mirrors/chromedriver
  $package config set operadriver_cdnurl https://npmmirror.com/mirrors/operadriver
  $package config set phantomjs_cdnurl https://npmmirror.com/mirrors/phantomjs
  $package config set selenium_cdnurl https://npmmirror.com/mirrors/selenium
  $package config set node_inspector_cdnurl https://npmmirror.com/mirrors/node-inspector
done
