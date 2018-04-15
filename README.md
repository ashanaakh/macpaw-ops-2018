# Macpaw DevOps Quest

**Prerequisites:**

- [Docker](https://www.docker.com/what-docker)

- [Nginx](https://www.nginx.com/resources/glossary/nginx/)

- [Logrotate](https://linux.die.net/man/8/logrotate)

- [Go programming language](https://golang.org/doc/install)

- [GNU Make](https://www.gnu.org/software/make/)

## Usage

Build and run docker container locally

```
$ make
```

## GetIP

### Overview

Server written in *golang*, that prints client `IP` and  `PORT`.

### Usage

Let's Move to getip directory

```
$ cd getip
```

Install dependencies

```
$ go get ./...
```

Build project

```
$ go build
```

Run server

```
$ ./main
```
