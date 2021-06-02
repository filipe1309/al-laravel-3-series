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
docker-compose exec app php artisan make:mail NovaSerie
```

http://localhost:5002/visualizando-email

## Class 2

http://localhost:5002/enviando-email

```sh
docker-compose exec app php artisan migrate:fresh
```
