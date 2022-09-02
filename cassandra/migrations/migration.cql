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

CREATE TABLE IF NOT EXISTS active_users_in_course
(
    course_id varchar,
    partition varchar,
    user_count int,
    PRIMARY KEY ( (course_id), partition )
) WITH default_time_to_live = 10;

CREATE TABLE IF NOT EXISTS active_users
(
    tof int,
    partition varchar,
    user_count int,
    PRIMARY KEY ( (tof), partition )
) WITH default_time_to_live = 10;

CREATE TABLE IF NOT EXISTS event_types_count
(
    event_type varchar,
    partition varchar,
    event_count int,
    PRIMARY KEY ( (event_type), partition )
) WITH default_time_to_live = 600;

CREATE TABLE IF NOT EXISTS course_played_time
(
    course_id int,
    partition varchar,
    play_time int,
    PRIMARY KEY ( (course_id), partition )
) WITH default_time_to_live = 60;
