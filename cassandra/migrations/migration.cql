DROP KEYSPACE IF EXISTS story;
CREATE KEYSPACE story WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '2' };

USE story;

CREATE TABLE IF NOT EXISTS events_by_user_course
(
    uuid       uuid,
    course_id  varchar,
    user_id    int,
    session_id varchar,
    event_type varchar,
    event_time timestamp,
    PRIMARY KEY ( (user_id, course_id), event_time, uuid )
) with clustering order by (event_time desc);

CREATE TABLE IF NOT EXISTS events_by_user
(
    uuid       uuid,
    course_id  varchar,
    user_id    int,
    session_id varchar,
    event_type varchar,
    event_time timestamp,
    PRIMARY KEY ( (user_id), event_time, uuid )
) with clustering order by (event_time desc);

CREATE TABLE IF NOT EXISTS events_by_course
(
    uuid       uuid,
    course_id  varchar,
    user_id    int,
    session_id varchar,
    event_type varchar,
    event_time timestamp,
    PRIMARY KEY ( (course_id), event_time, uuid )
) with clustering order by (event_time desc);

CREATE TABLE IF NOT EXISTS active_users_in_course
(
    course_id  varchar,
    partition  int,
    user_count int,
    PRIMARY KEY ( (course_id), partition )
) WITH default_time_to_live = 60;

CREATE TABLE IF NOT EXISTS active_users
(
    tof        int,
    partition  int,
    user_count int,
    PRIMARY KEY ( (tof), partition )
) WITH default_time_to_live = 60;

CREATE TABLE IF NOT EXISTS event_types_count
(
    event_type  varchar,
    partition   int,
    event_count int,
    PRIMARY KEY ( (event_type), partition )
) WITH default_time_to_live = 60;

CREATE TABLE IF NOT EXISTS event_types_count_in_course
(
    course_id   varchar,
    event_type  varchar,
    partition   int,
    event_count int,
    PRIMARY KEY ( (event_type, course_id), partition )
) WITH default_time_to_live = 60;

CREATE TABLE IF NOT EXISTS course_played_time
(
    course_id varchar,
    partition int,
    play_time bigint,
    PRIMARY KEY ( (course_id), partition )
) WITH default_time_to_live = 60;
