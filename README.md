# Cantor

A set of docker-compose config to setup a development environment or setup a light production environment.

## Use in global
1. clone cantor to project dir
```shell
    git clone https://github.com/jason-chang/cantor.git some_dir
```
2. create `.env` file
```shell
    cp .env.example .env
```

## Use for project 
1. clone cantor to project dir
```shell
    git clone https://github.com/jason-chang/cantor.git some-project/docker-cantor
```
2. create `.env` file
```shell
    cp .env.example .env
```
3. edit `.env` set new `COMPOSE_PROJECT_NAME` like bollow.
```yaml
# Define the prefix of container names. This is useful if you have multiple projects that use cantor to have separate containers per project.
COMPOSE_PROJECT_NAME=some_project
```

# Create Mutiple Database When Posgres Init
create new init_xxx_db.sh in 'postgres/docker-entrypoint-initdb.d' dir.

# Run Mutiple Instance of PHPWorker
...

## License

[MIT](https://github.com/jason-chang/cantor/blob/master/LICENSE) © Jason Chang
