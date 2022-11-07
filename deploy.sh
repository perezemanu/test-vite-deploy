#!/bin/bash
# script for deploying to github pages
read -p "Are you sure that you want to deploy?(y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
# if the gh-pages dependecy is not installed, install it
if [ ! -d "node_modules/gh-pages" ]; then
    npm install gh-pages --save-dev --force
fi
# build the project
npm run build && npm run deploy -- -m "deploying to github pages by sh"