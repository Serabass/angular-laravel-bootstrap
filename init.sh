#!/usr/bin/env bash

# Получаем название проекта по имени текущей директории
PROJECTNAME=${PWD##*/}
echo Crafting project $PROJECTNAME...

# Удаляем привязку к этому репозиторию, она нам не нужна
rm .git -rf

# Инициализируем новый git-репозиторий
git init

# Глобально ставим модуль json. Он нам пригодится, чтобы править package.json (https://www.npmjs.com/package/json)
yarn global add json

# Инициализируем новый node-проект
yarn init -yp

# Ставим Angular-CLI и Lerna
yarn add @angular/cli lerna

# Приводим проект в нужный вид, необходимый для работы с Lerna
yarn lerna init

cd packages

# Крафтим новое ангуляр-приложение (в ходе установки консоль задаст несколько вопросов)
yarn ng new frontend
cd ..

# Не спрашивайте зачем это здесь и почему вот так.
mv frontend packages

# Проваливаемся в директорию нового приложения
cd packages/frontend

# Ставим необходимые модули
yarn add @ngx-resource/core \
         @ngx-resource/handler-ngx-http \
         @uirouter/angular \
         faker \
         jquery \
         lodash \
         moment \
         reflect-metadata

# Этот ставим отдельно, потому что там происходит ангуляровская магия с развёртыванием
# (в ходе установки консоль задаст несколько вопросов)
yarn ng add ng-zorro-antd --i18n=ru_RU

# Возвращаемся в корень
cd ../..

# Забираем конфиг для прокси (он нам нужен для удобной работы с бэкендом на этапе разработки)
mv proxy.config.json packages/frontend

# Снова идём к фронту
cd packages/frontend

# Обновляем задачу start, чтобы работало через прокси
cat package.json | json -e "this.scripts.start += ' --proxy-config proxy.config.json --port 4201'" > package.json

# Прописываем имя пакета
cat package.json | json -e "this.name = '@$PROJECTNAME/frontend'" > package.json

# Возвращаемся в packages
cd ../

# Ставим инсталлер Ларавела
composer global require laravel/installer

# Крафтим бэк
laravel new backend

# Проваливаемся в директорию новоиспечённого бэкенда
cd backend

# Запрашиваем нужные пакеты
composer require laravelrus/sleepingowl \
                 doctrine/dbal \
                 barryvdh/laravel-ide-helper \
                 symfony/yaml

# Устанавливаем нодовые зависимости
yarn

# Прописываем нужные команды (подробнее в README)
cat package.json | json -e "this.scripts.art = 'php artisan'" > package.json
cat package.json | json -e "this.scripts.seed = 'yarn art migrate:fresh && yarn art db:seed'" > package.json
cat package.json | json -e "this.scripts.mf = 'yarn art migrate:fresh'" > package.json
cat package.json | json -e "this.scripts.start = 'yarn art serve'" > package.json
cat package.json | json -e "this.scripts.m = 'yarn art migrate'" > package.json
cat package.json | json -e "this.scripts['ide-helper'] = 'yarn art ide-helper:eloquent && yarn art ide-helper:generate && yarn art ide-helper:meta && yarn art ide-helper:models'" > package.json

# Ставим Сову
yarn art sleepingowl:install

# Возвращаемся в корень
cd ../..

# Прописываем в корневом package.json две задачи, которые будут вызывать одноимённые задачи во внутренних пакетах (lerna привет)
cat package.json | json -e "if (this.scripts == undefined) this.scripts = {};" > package.json
cat package.json | json -e "this.scripts.start = 'lerna run start --stream --parallel';" > package.json
cat package.json | json -e "this.scripts.build = 'lerna run build --stream --parallel';" > package.json

# Снова идём в бэк
cd packages/backend

# и прописываем ему имя пакета
cat package.json | json -e "this.name = '@$PROJECTNAME/backend'" > package.json

# Мы скрафтили приложение и готовы к работе
echo Crafting complete!

# Возвращаемся в корень
cd ../..

# Добавляем всё это добро в гит
git add .

# Коммитим
git commit -m "Bootstrap!"

# Мы молодцы
echo Commited!
