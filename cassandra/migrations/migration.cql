DROP KEYSPACE IF EXISTS story;
CREATE KEYSPACE story WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };

USE story;

CREATE TABLE IF NOT EXISTS events
(
    course_id  varchar,
    user_id    int,
    session_id varchar,
    event_type varchar,
    event_time ,
    PRIMARY KEY ( (user_id, course_id), session_id, event_type, event_time )
);

