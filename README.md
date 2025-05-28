[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png)](#blocktanks-analytics)
# ➤ Blocktanks Analytics

## What is this project?

This project works with the API for the game <https://blocktanks.io> to collect data on player activity and map popularity. It stores data in a SQL database in this form and periodically (every 24 hours) downloads data to csv files so they can be analyzed. The shell script also creates a python http server that lets people download a zip file of the latest data from a website.

```
 id |         time_taken         | total_humans | signed_up_players | max_players | avg_hours_played |      map
----+----------------------------+--------------+-------------------+-------------+------------------+---------------
  1 | 2025-05-27 19:45:02.703581 |            0 |                 0 |          16 |            0.000 | More Chambers
  2 | 2025-05-27 20:00:02.955382 |            0 |                 0 |          16 |            0.000 | More Chambers
  3 | 2025-05-27 20:05:03.254452 |            3 |                 1 |          16 |          237.000 | Downtown
```

This project aims to help Blocktanks community members better understand how people play the game, what maps they most enjoy, when they are most active, etc. 

## Deployment

First you must clone the directory, cd into it, and create a file for the shell script's output log

```shell
git clone https://github.com/ChancellorCeti/blocktanks-analytics.git
cd blocktanks-analytics
chmod +x make_csv_files.sh
touch output.log
```

Next, you have to declare the needed environment variables. Run
```shell
touch .env
```

And then use your favorite text editor to set its contents to the following
```.env
POSTGRES_USER=user
POSTGRES_PASSWORD=password
POSTGRES_DB=bt_analytics
#PG_HOST=bt_analytics_db #for use with docker
#PG_HOST=localhost #for use without docker
PG_USER=user
PG_PASSWORD=password
PG_DBNAME=bt_analytics
#XXPORT=5432 # for use without docker
#XXPORT=5433 # for use with docker
```
Remove the `#` characters as needed depending on whether you are using Docker or not. Change `username` and `password` as you wish, but note that if you change them in the `.env` file, you must also change the username in `make_csv_files.sh` and declare an environment variable `PGPASSWORD` equal to the password before running the shell script.

Then, if using Docker, just run

```shell
docker build -t bt_analytics_main .
docker compose up -d # can remove '-d' if daemon mode not wanted
sudo nohup ./make_csv_files.sh > output.log 2>&1 &
```

If not using Docker, you must first install postgresql -- how you do this will vary according to OS and package manager. Then run

```shell
systemctl start postgres# only needed if using systemctl
su postgres
initdb -D /var/lib/postgres/data
createuser --interactive
```
In the interactive user creation, the role name should be the user name you have on your computer -- if you don't do this you'll have to append `-O role-name` to the next command. Also make yourself a superuser when creating the new user. Change the `PG_USER` environment variable in `.env` to be the role name you chose just now.
Then open a shell and run
```shell
createdb bt_analytics # -O rolename if rolename isn't same as your user name
```

Now run in one terminal window
```shell
cargo run --release
```
And in another window run
```shell
sudo nohup ./make_csv_files.sh > output.log 2>&1 &
```

To shut down the server, if using Docker simply run
```bash
docker compose kill
pkill -f make_csv_files.sh
rm server.pid
sudo rm -rf data
```
If not using Docker, just replace the first `docker compose kill` command with a `ctrl+c` for the Cargo process.

## Planned Updates

1. Creating an API and deploying it on an AWS ec2 instance so people can ping it get the latest csv files. Work in progress
2. Simplifying the deployment process a bit.
3. Fixing file permissions so you don't need `sudo` for cleaning up logfiles and data files
