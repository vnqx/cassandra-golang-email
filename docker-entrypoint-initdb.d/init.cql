CREATE KEYSPACE public
    WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE public;

CREATE TABLE message (
    id           UUID,
    email        text,
    title        text,
    content      text,
    magic_number int,
    created_at   timestamp,
    PRIMARY KEY (email, created_at, id)
) WITH CLUSTERING ORDER BY (created_at DESC, id ASC) AND
    default_time_to_live = 300; -- messages get destroyed after 5 minutes.

CREATE INDEX ON message(magic_number);