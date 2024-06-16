-- Add migration script here
DROP TABLE IF EXISTS usa_dodgeball;
DROP TABLE IF EXISTS usa_ctf;
DROP TABLE IF EXISTS usa_payload;
DROP TABLE IF EXISTS usa_tdm;
DROP TABLE IF EXISTS usa_ffa;

DROP TABLE IF EXISTS europe_dodgeball;
DROP TABLE IF EXISTS europe_ctf;
DROP TABLE IF EXISTS europe_payload;
DROP TABLE IF EXISTS europe_tdm;
DROP TABLE IF EXISTS europe_ffa;

DROP TABLE IF EXISTS asia_dodgeball;
DROP TABLE IF EXISTS asia_ctf;
DROP TABLE IF EXISTS asia_payload;
DROP TABLE IF EXISTS asia_tdm;
DROP TABLE IF EXISTS asia_ffa;

-- Create tables for game modes within each region
CREATE TABLE usa_dodgeball (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_ctf (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_payload (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_tdm (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_ffa (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

-- West Region
CREATE TABLE europe_dodgeball (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_ctf (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_payload (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_tdm (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_ffa (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

-- South Region
CREATE TABLE asia_dodgeball (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_ctf (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_payload (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_tdm (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_ffa (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(10,3) NOT NULL,
    map VARCHAR(35) NOT NULL
)
