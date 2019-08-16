Репозиторий для быстрого развёртывания проекта с использованием [Laravel](https://laravel.com/), [Angular](https://angular.io/) и [Lerna](https://github.com/lerna/lerna).

Что под капотом:
 * [ng-zorro-antd](https://ng.ant.design/docs/introduce/en)
 * [@ngx-resource/core](https://www.npmjs.com/package/@ngx-resource/core)
 * [@uirouter/angular](https://www.npmjs.com/package/@uirouter/angular)
 * [LaravelRUS/SleepingOwlAdmin](https://github.com/LaravelRUS/SleepingOwlAdmin)
 * [barryvdh/laravel-ide-helper](https://github.com/barryvdh/laravel-ide-helper)

Все подробности см. в [init.sh](/init.sh)

```
 $ git clone https://github.com/Serabass/angular-laravel-bootstrap <project-name>
 $ cd <project-name>
 $ sh init.sh
 $ yarn start
```

Проверить в браузере: http://localhost:4201/

Чтобы положить всё в репозиторий:
```
 $ git remote add origin <your-repo-url>
 $ git push -u origin master
```
_**Примечание**: локальный коммит выполняется автоматически после выполнения всех установок_

# Краткий экскурс по командам
## Backend
 * `yarn art` - Короткая запись `php artisan`. (`yarn art migrate` == `php artisan migrate`)
 * `yarn mf` - Короткая запись `php artisan migrate:fresh`. Очищает всю базу данных и выполняет [миграции](https://laravel.com/docs/5.8/migrations#running-migrations) с нуля.
 * `yarn seed` - Сбросить всю базу данных и заполнить имеющимися [сидами](https://laravel.com/docs/5.8/seeding). 
 * `yarn m` - Короткая запись `php artisan migrate`
 * `yarn ide-helper` - Вызвать [ide-helper](https://github.com/barryvdh/laravel-ide-helper)
 * `yarn start` - запустить все вложенные проекты через Lerna
 * `yarn build` - забилдить все вложенные проекты через Lerna


# TODO
* Добавить автоматическую генерацию задач для PHPStorm (yarn start, etc)
* Добавить common-модуль
* Раскурить деплой в гитлабе и генерировать `.gitlab-ci.yml`
* Добавить [`Homestead`](https://laravel.com/docs/5.8/homestead)

# Аналогичные репы в планах
* Angular + Node + Express \[+ GraphQL]
* Angular + .net Core
* Angular + Grails
* и многое другое
