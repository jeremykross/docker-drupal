# Drupal

See https://www.drupal.org/ for more information about Drupal.

## What is the Containership Marketplace?

The Containership marketplace is a series of containerized applications configured to easily run and scale on a [containership.io](https://containership.io) cluster! Many conveniences such as High-Availability, automatic clustering among others are able to be configured out of the box allowing you to scale seamlessly as your infrastructure is required to grow.

> **Note:** If you attempt to run this image outside of a containership cluster, we cannot guarantee that it will run properly.

### Author
ContainerShip Developers - developers@containership.io

### Configuration
This Dockerfile provides a Drupal installation that requires an external database.

The following environment variables must be provided:

    DB_TYPE = type of database. eg; pgsql, mysql
    DB_HOST = ip or hostname of database
    DB_PORT = database port
    DB_NAME = database name
    DB_USER = database user
    DB_PASS = database password

## Contributing
Pull requests and issues are encouraged!
