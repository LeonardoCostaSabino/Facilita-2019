Facilita é uma plataforma para agentes de transformação com foco na otimização e aumento da venda de Previdência Privada

Time: Bruno Barros de Souza Jessica Lessa Barbosa Rayanne Ramos João Carlos Marcelino Leonardo Sabino

Para instalar executar o arquivo start.sh e escolher a opção 5!!

Executar esses comandos para levantar o banco de Dados

docker-compose exec db-f bash

mysql -u root -p -> 123456

GRANT ALL ON facilita.* TO 'root'@'%' IDENTIFIED BY '123456';

flush privileges;

exit

exit

docker-compose exec app-f php artisan migrate
