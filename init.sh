#!/usr/bin/env bash

PROJECTNAME=${PWD##*/}
echo Crafting project $PROJECTNAME...

rm .git -rf
git init
yarn global add json
yarn init -yp
yarn add @angular/cli lerna
yarn lerna init
cd packages
yarn ng new frontend
cd ..
mv frontend packages
cd packages/frontend
yarn add @ngx-resource/core @ngx-resource/handler-ngx-http @uirouter/angular faker jquery lodash moment reflect-metadata
yarn ng add ng-zorro-antd --i18n=ru_RU
cd ../..
mv proxy.config.json packages/frontend
cd packages/frontend
cat package.json | json -e "this.scripts.start += ' --proxy-config proxy.config.json --port 4201'" > package.json
cat package.json | json -e "this.name = '@$PROJECTNAME/frontend'" > package.json
cd ../
composer global require laravel/installer
laravel new backend
cd backend
composer require laravelrus/sleepingowl doctrine/dbal barryvdh/laravel-ide-helper symfony/yaml
yarn
cat package.json | json -e "this.scripts.art = 'php artisan'" > package.json
cat package.json | json -e "this.scripts.seed = 'yarn art migrate:fresh && yarn art db:seed'" > package.json
cat package.json | json -e "this.scripts.mf = 'yarn art migrate:fresh'" > package.json
cat package.json | json -e "this.scripts.start = 'php artisan serve'" > package.json
yarn art sleepingowl:install
cd ../..
cat package.json | json -e "if (this.scripts == undefined) this.scripts = {};" > package.json
cat package.json | json -e "this.scripts.start = 'lerna run start --stream --parallel';" > package.json
cat package.json | json -e "this.scripts.build = 'lerna run build --stream --parallel';" > package.json

cd packages/frontend

cd ../backend
cat package.json | json -e "this.name = '@$PROJECTNAME/backend'" > package.json
echo Crafting complete!

git add .
git commit -m "Bootstrap!"
