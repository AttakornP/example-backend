# Example Backend Project

## How to run on local

```bash
python manage.py migrate

make run
```

## How to build docker image
```bash
# For developer
docker-compose build hello_world-dev

# For server
docker-compose build hello_world-dev
```

## How to run docker container
```bash
# For developer
docker-compose up -d hello_world-dev

# For server
docker-compose up -d hello_world
```

## Open on browser with http://localhost:9090