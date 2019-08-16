Репозиторий для быстрого развёртывания проекта с использованием Laravel, Angular и Lerna.

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

TODO:
* Добавить автоматическую генерацию задач для PHPStorm (yarn start, etc)
* Добавить common-модуль
* Раскурить деплой в гитлабе и генерировать `.gitlab-ci.yml`
