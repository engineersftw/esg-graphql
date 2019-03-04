# Engineers.SG GraphQL Service

- [ ] Schema file
- [ ] Preliminary implementation via Phoenix (Elixir) + Absinthe

### Development Quick Start

Prerequisites:

  * [Elixir] 1.7+
  * [Erlang / OTP] 20+

To start your Phoenix server:

  * Run `mix install` to install dependencies
  * Run `mix start` to start the server on [`localhost:4000`](http://localhost:4000)

### Docker Image

Prerequisites:

  * [Docker] 17.05+

To build and run the service in Docker:

  * Run `docker build .` to create a production-ready Docker image via multi-stage build, accessible on [`localhost:4000`](http://localhost:4000)


### Docker Compose

  * Run `docker-compose up -d` to run the complete solution (GraphQL and database service) in the background
  * Run `docker-compose up db -d` to run only the database service in the background
  * Run `docker-compose stop` to stop all running services

### Restore DB from pg_dump

Prerequisites:

  * Database backup file (archive format)
  * Database service container up and running from `docker-compose.yml`
  * Existing `ROLE` ID in the backup to recreate

First we need to copy the database backup into the database service container:

  1. Run `docker ps` to get the running database service container ID
  1. Run `docker cp ~/<database backup archive file> <container ID>:/tmp` to copy the backup file into the container
  1. Run `docker exec -it <container ID> bash` to login and start with bash in container

In the container, before restoring, we need to prepare the out-of-the box schema:

  1. Run `psql -U postgres -d postgres -c 'DROP SCHEMA public'` to drop the default `public` schema, it will be recreated during the restore process
  1. Run `psql -U postgres -d postgres -c 'CREATE ROLE <role ID> WITH LOGIN ENCRYPTED PASSWORD 'S3cret!';'` to recreate the same role as found in the backup

In the container, after preparation, we can run the following command to restore the database in full:

  1. Run `pg_restore -U postgres -d postgres -1 /tmp/<database backup archive file>` to restore the backup


[Docker]: https://www.docker.com/
[Elixir]: https://elixir-lang.org/
[Erlang / OTP]: https://www.erlang.org/
