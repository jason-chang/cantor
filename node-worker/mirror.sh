#!/usr/bin/env bash

# Set the registry for all package managers
set_registry() {
  package=$1
  echo "Setting registry for $package"
  $package config set registry https://registry.npmmirror.com
}

echo "npm yarn pnpm" | while read package; do
  set_registry $package
done
