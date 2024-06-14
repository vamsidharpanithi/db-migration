FROM flyway/flyway:10

RUN mkdir -p /flyway/sql /flyway/conf

# Copy your Flyway configuration file (e.g., flyway.conf) into the image
COPY flyway.conf /flyway/conf/

# Copy your SQL migration scripts into the image
COPY ./migrations/* /flyway/sql