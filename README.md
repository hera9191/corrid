# Correlation ID

Small Lab for testing variouls logging stategy accross various languages and frameworks.

## Sources

- [Correlation IDs for microservices architectures](https://hilton.org.uk/blog/microservices-correlation-id)
- [The Value of Correlation IDs](https://www.rapid7.com/blog/post/2016/12/23/the-value-of-correlation-ids/)
- [HTTP Request ID](https://devcenter.heroku.com/articles/http-request-id)

## install

```bash
# Pre-requisites: BuildKit plugin for Docker installed
# To install BuildKit plugin for Docker go to: https://github.com/moby/buildkit/releases
docker buildx version > /dev/null && echo OK || echo "ERROR: BuildKit plugin for Docker is not installed"
```

```bash
git clone https://github.com/hera9191/corrid.git
cd corrid
# Build, Start and stop
#   make build    - build all services
#   make up       - start all services in foreground
#   make upd      - start all services in background
#   make restart  - restart all services
#   make down     - stop all services
make  
```

## Overview

Labs is split into two docker compose files:

- `docker-compose.base.yml` - contains base infrastructure (Grafana, Loki, Prometheus, Promtail)
- `docker-compose.apps.yml` - contains all services and loadbalancers

### Links

- [Grafana http://localhost:3000](http://localhost:3000) - anonymous access enabled
- [Prometheus http://localhost:9090](http://localhost:9090)
- [Tyche http://localhost:8080/int](http://localhost:8080/int) - Random Int Generator (*Spring Boot*)

## Loki

Usefull queries:

- `{kind="core"} |= `` | json` - get all logs witj label `kind=core` and aplly json filter
- ```{kind="core"} |= `` | json | level = `fatal` ``` - to see all fatal logs records

## Troubleshooting

### Prometheus/Promtail labels

In Prometheus like labels names are not allowed '.' and '-' characters. So, if you want to use correlation id as label, you should replace '.' and '-' characters with '_'.

## Java - Spring Boot

- [Docker Buldkit Mount Cache](https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/reference.md#run---mounttypecache)
- [Spring Boot Docker](https://spring.io/guides/topicals/spring-boot-docker/)
  - legacy: 367 MB (cca 600 MB chache)
    - first run: 52 sec
    - later run: 21 sec
  - recommended: 338 MB (cca 290 MB chache)
    - first run: 36 sec
    - later run: 20 sec
  - buildkit w/ jre: 200 MB (cca 190 MB chache)
    - first run: 39 sec
    - later run: **4.5 sec**
- [Custom Json Lockback Layout](https://github.com/raevilman/vlog-logback-json-data)
