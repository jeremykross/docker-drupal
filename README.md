docker-drupal
=============

drupal in docker without database.

This Dockerfile provides a Drupal installation that requires an external database.

The following environment variables must be provided

DB_TYPE = type of database. eg; pgsql, mysql
DB_HOST = ip or hostname of database
DB_PORT = database port
DB_NAME = database name
DB_USER = database user
DB_PASS = database password
