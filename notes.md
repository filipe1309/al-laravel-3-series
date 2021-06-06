# DevOnTheRun Notes

> notes taken during the course

http://localhost:5002/series

https://www.digitalocean.com/community/tutorials/how-to-install-and-set-up-laravel-with-docker-compose-on-ubuntu-20-04

```sh
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan config:cache

docker-compose exec db bash
mysql -u root -p
GRANT ALL ON laravel.* TO 'laraveluser'@'%' IDENTIFIED BY 'your_laravel_db_password';
FLUSH PRIVILEGES;
EXIT;

docker-compose exec app php artisan migrate

docker-compose exec app php artisan make:seeder UserSeeder
docker-compose exec app php artisan db:seed

```

## Class 1

```sh
docker-compose exec app php artisan serve

docker-compose exec app php artisan make:mail NovaSerie
```

http://localhost:5002/visualizando-email

## Class 2

http://localhost:5002/enviando-email

```sh
docker-compose exec app php artisan migrate:fresh
```

## Class 3

```sh
# SQS
docker-compose exec app php artisan queue:table

# DLQ
docker-compose exec app php artisan queue:failed-table

docker-compose exec app php artisan migrate
```

```sh
docker-compose exec app php artisan tinker
>>> \DB::select('SELECT * FROM jobs');

-> docker-compose exec app php artisan queue:listen --tries=1

>>> \DB::select('SELECT * FROM failed_jobs');

docker-compose exec app php artisan queue:failed

# Envia da tabela failed_jobs para jobs
# queue:retry ID do job
docker-compose exec app php artisan queue:retry 1

docker-compose exec app php artisan queue:listen --tries=2 --delay=5
```

## Class 4

```sh
docker-compose exec app php artisan make:event NovaSerie
docker-compose exec app php artisan make:listener EnviarEmailNovaSerieCadastrada -e NovaSerie
docker-compose exec app php artisan make:listener LogNovaSerieCadastrada -e NovaSerie
```

## Class 5

```sh
docker-compose exec app php artisan make:migration --table=series adiciona_campo_capa_na_serie
docker-compose exec app php artisan migrate

docker-compose exec app php artisan tinker
>>> \App\Serie::all();

docker-compose exec app php artisan storage:link
http://localhost:5002/storage/serie/ZFB9eYk5LZr4O2Mh0P7U6yitpuLkntxwZEq3gOdS.jpg
```

## Class 6

```sh
docker-compose exec app php artisan make:event SerieApagada
docker-compose exec app php artisan make:listener -e SerieApagada ExcluirCapaSerie

docker-compose exec app php artisan tinker
>>> \DB::select('SELECT * FROM jobs');
>>> \DB::delete('DELETE FROM jobs');
>>> \DB::select('SELECT * FROM failed_jobs');
>>> \DB::delete('DELETE FROM failed_jobs');

docker-compose exec app php artisan queue:listen --tries=1
```

```sh
docker-compose exec app php artisan make:job ExcluirCapaSerie

docker-compose exec app php artisan tinker
>>> \DB::select('SELECT * FROM jobs');

docker-compose exec app php artisan queue:work --tries=1
```

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7

## CLASS-7
