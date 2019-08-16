Репозиторий для быстрого развёртывания проекта с использованием Laravel, Angular и Lerna.

Что под капотом:
 * ng-zorro-antd
 * @ngx-resource/core
 * @uirouter/angular
 * laravelrus/sleepingowl
 * barryvdh/laravel-ide-helper

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
