# <p align="center">Laravel | Series 🎬</p>

<p align="center">
    <img src="https://img.shields.io/badge/Tools-Docker-informational?style=flat-square&logo=docker&color=2496ED" alt="Docker" />
    <img src="https://img.shields.io/badge/Code-Laravel-informational?style=flat-square&logo=laravel&color=FF2D20" alt="Laravel" />
</p>

## 💬 About

This project was developed following [Laravel parte 3: Eventos, filas, upload e e-mail](https://cursos.alura.com.br/course/laravel-eventos-filas-upload-email) course.

Base project: https://github.com/filipe1309/al-php-laravel

## :computer: Technologies

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Laravel](https://laravel.com/)
- [PHP](https://www.php.net/)
- [Nginx](https://www.nginx.com/)
- [MySQL](https://www.mysql.com/)

## :scroll: Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## :cd: Installation

```sh
git clone git@github.com:filipe1309/al-laravel-3-series.git
```

```sh
cd al-laravel-3-series
```

After run for the fisrt time

```sh
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan config:cache
```

## :runner: Running

```sh
docker-compose up
```

> Access http://localhost:5002

## License

[MIT](https://choosealicense.com/licenses/mit/)

## About Me

<p align="center">
    <a style="font-weight: bold" href="https://www.linkedin.com/in/filipe1309/">
    <img style="border-radius:50%" width="100px; "src="https://avatars.githubusercontent.com/u/2081014?s=60&v=4"/>
    </a>
</p>

---

<p align="center">
    Done with ♥ by <a style="font-weight: bold" href="https://www.linkedin.com/in/filipe1309/">Filipe Leuch Bonfim</a> 🖖
</p>
