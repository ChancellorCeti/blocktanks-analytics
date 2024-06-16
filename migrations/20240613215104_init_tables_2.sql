-- Add migration script here
-- Create tables for game modes within each region
CREATE TABLE usa_dodgeball (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_ctf (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_payload (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_tdm (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE usa_ffa (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

-- West Region
CREATE TABLE europe_dodgeball (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_ctf (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_payload (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_tdm (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE europe_ffa (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

-- South Region
CREATE TABLE asia_dodgeball (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_ctf (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_payload (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_tdm (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);

CREATE TABLE asia_ffa (
    id SERIAL PRIMARY KEY,
    time_taken TIMESTAMP NOT NULL,
    total_humans INT NOT NULL,
    signed_up_players INT NOT NULL,
    max_players INT NOT NULL,
    avg_hours_played DECIMAL(5,2) NOT NULL,
    map VARCHAR(35) NOT NULL
);
