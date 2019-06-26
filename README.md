
mkdir <project-name>
cd <project-name>
git init
yarn init
yarn add @angular/cli lerna
yarn lerna init
cd packages
yarn ng new frontend
cd ..
mv frontend packages
cd packages/frontend
yarn add @ngx-resource/core @ngx-resource/handler-ngx-http @uirouter/angular faker jquery lodash moment reflect-metadata
yarn ng add ng-zorro-antd --i18n=ru_RU
curl https://raw.githubusercontent.com/Serabass/angular-laravel-bootstrap/master/proxy.config.json > proxy.config.json
cd ../
composer global require laravel/installer
laravel new backend
