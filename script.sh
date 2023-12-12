#!/bin/bash

if [[ -f ./project/package.json ]]; then
    cd project
    npm install
    npm run dev
else
    npm -y create vite@latest my-app -- --template react-ts
    cd my-app
    npm install
    rm README.md
    rm vite.config.ts
    cd ..

    cp -r my-app/. project/.
    rm -r my-app

    cd project
    chown -R node:node /project/node_modules
    chown -R node:node /project/public
    chown -R node:node /project/src
    chown -R node:node /project/package.json
    chown -R node:node /project/package-lock.json
    chown -R node:node /project/tsconfig.json
    chown -R node:node /project/tsconfig.node.json
    chown -R node:node /project/index.html
    chown -R node:node /project/vite.config.ts
    chown -R node:node /project/.eslintrc.cjs
    chown -R node:node /project/.gitignore
    npm run dev
fi
