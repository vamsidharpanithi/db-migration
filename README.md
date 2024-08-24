# Database Migration with Flyway and Docker


## Introduction

This project leverages Flyway to manage and version control database schema changes. It uses Docker to containerize the Flyway configuration, allowing for consistent and repeatable migrations across different environments. The project includes scripts for creating a schema, a table, and an index within a PostgreSQL database.

## Prerequisites

- Docker installed on your machine.
- A running PostgreSQL database instance.
- Environment variables set up for the database connection.

## Installation

1. Clone the repository:
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. Build the Docker image:
    ```bash
    docker build -t flyway .
    ```
3. Run the Migrations:
    ```bash
    docker run --rm --name flyway \
        -e FLYWAY_URL=${FLYWAY_URL} \
        -e FLYWAY_USER=${FLYWAY_USER} \
        -e FLYWAY_PASSWORD=${FLYWAY_PASSWORD} \
        -e FLYWAY_SCHEMAS=${FLYWAY_SCHEMAS} \
        flyway migrate
    ```

## Configuration

The Flyway configuration is defined in the `flyway.conf` file:
