#bin/bash

echo "Bem-vindo ao Facilita-2019\n";

echo "Criado pela DigitalOcean, desenvolvedor utilizador: Leonardo Costa Sabino";

echo "-------------MENU------------------
      | 1 - Atualizar o ambiente
      | 2 - Atualizar o .env
      | 3 - Adicionar Host no Linux
      | 4 - Atualizar o ambiente
      | 5 - Primeira instalação do Facilita-2019"

read -r opcao

  case $opcao in
    1)
      docker run --rm -v $(pwd):/app composer install
      docker run --rm -v $(pwd):/app -w /app node:latest npm install
      docker-compose kill
      sudo chmod 777 -R .
      docker-compose up -d
      echo "Finalizado"
      echo "Por favor entre no seu navegador e digite: local.sod.unisuam.edu.br/home"
    ;;
    2)
      cp .env.backup .env
      exit;
    ;;
    3)
      sudo echo "127.0.1.1 local.sod.unisuam.edu.br" >> /etc/hosts
    ;;
    4)
      docker-compose up -d --build
      docker-compose exec app php artisan storage:link
      docker-compose exec app php artisan key:generate
      echo "Finalizado"
      echo "Por favor entre no seu navegador e digite: local.sod.unisuam.edu.br/home"
      ;;
    5)
      cp .env.example .env
      docker run --rm -v $(pwd):/app composer install
      docker run --rm -v $(pwd):/app -w /app node:latest npm install
      docker stop $(docker ps -aq)
      sudo chmod 777 -R .
      docker-compose up -d
      docker-compose exec app-f php artisan storage:link
      docker-compose exec app-f php artisan key:generate
      sudo echo "127.0.1.1 local.facilita.com.br" >> /etc/hosts
      echo "Finalizado"
      echo "Por favor entre no seu navegador e digite: local.facilita.com.br/"
      ;;
esac
