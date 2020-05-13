# Nobe Test - Implementação
## Configuração

Clone o projeto

```sh
$ git clone https://github.com/pedrohcrisanto/nobu.git
```

Instale as dependências
```sh
$ cd /nobu/
$ sudo docker-compose run --rm app bundle install
```

Crie o banco e migre as tabelas
```sh
$ sudo docker-compose run --rm app bundle exec rails db:create db:migrate 
```

Rode a aplicação
```sh
$ sudo docker-compose up
```

Abra o seu navegador(de preferência Chrome ou Firefox) e navegue para `localhost:3000`

Para realizar Testes
```sh
$ sudo docker-compose run --rm app bundle exec rspec
```
## Deploy no Heroku

https://nobenk.herokuapp.com/

