Репозиторий для быстрого развёртывания проекта с использованием [Laravel](https://laravel.com/), [Angular](https://angular.io/) и [Lerna](https://github.com/lerna/lerna).

# Требования
 * [Глобально установленный Yarn](https://yarnpkg.com/lang/en/)
 * [Глобально установленный Composer](https://getcomposer.org/)
 * PHP
 * Желание сэкономить время

# Что под капотом
 * [NgZorro (Ant Design for Angular)](https://ng.ant.design/docs/introduce/en)
 * [@ngx-resource/core](https://www.npmjs.com/package/@ngx-resource/core)
 * [@uirouter/angular](https://www.npmjs.com/package/@uirouter/angular)
 * [LaravelRUS/SleepingOwlAdmin](https://github.com/LaravelRUS/SleepingOwlAdmin)
 * [barryvdh/laravel-ide-helper](https://github.com/barryvdh/laravel-ide-helper)

Все подробности см. в [init.sh](/init.sh) (Описал выполнение каждой команды в комментариях)

# Крафтим новый проект
```
 $ git clone https://github.com/Serabass/angular-laravel-bootstrap <project-name>
 $ cd <project-name>
 $ sh init.sh
 $ yarn start
```

Проверяем в браузере: http://localhost:4201/

Кладём в свой репозиторий:
```
 $ git remote add origin <your-repo-url>
 $ git push -u origin master
```
_**Примечание**: локальный коммит выполняется автоматически после выполнения всех установок_

# Краткий экскурс по командам
## Backend
 * `yarn art` - Короткая запись `php artisan`. (`yarn art migrate` == `php artisan migrate`)
 * `yarn mf` - Короткая запись `php artisan migrate:fresh`. Очищает всю базу данных и выполняет [миграции](https://laravel.com/docs/5.8/migrations#running-migrations) с нуля. Полезно на начальных этапах разработки
 * `yarn seed` - Сбросить всю базу данных и заполнить имеющимися [сидами](https://laravel.com/docs/5.8/seeding). (`migrate:fresh && db:seed`)
 * `yarn m` - Короткая запись `php artisan migrate`
 * `yarn ide-helper` - Вызвать [ide-helper](https://github.com/barryvdh/laravel-ide-helper)

## Root
 * `yarn start` - запустить все вложенные проекты через Lerna
 * `yarn build` - забилдить все вложенные проекты через Lerna

# Contributing
Предлагайте свои плюшки в [Issues](https://github.com/Serabass/angular-laravel-bootstrap/issues)

# TODO
* Добавить автоматическую конфигурация запуска для PHPStorm / VSCode / Visual Studio
* Добавить common-модуль
* Раскурить деплой в гитлабе и генерировать `.gitlab-ci.yml`
* Добавить [Homestead](https://laravel.com/docs/5.8/homestead)
* Украсить вывод перенаправлением в /dev/null и своими сообщениями
* Добавить [YaRoute](https://github.com/Serabass/yaroute)

# Аналогичные репы 
* [Angular + Node + Express](https://github.com/Serabass/angular-node-bootstrap)
## в планах
* Angular + Node + Express + GraphQL
* Angular + .Net Core
* Angular + Grails
* NativeScript
* Electron
* и многое другое
