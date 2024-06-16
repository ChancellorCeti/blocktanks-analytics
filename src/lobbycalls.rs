#![allow(non_snake_case)]
use crate::apicalls;
use serde::{Deserialize, Serialize};
use serde_json::Result;

#[derive(Debug, Serialize, Deserialize, Clone)]
struct Player {
    username: String,
    joined: u64,
}

#[derive(Debug, Serialize, Deserialize)]
struct Game {
    host: String,
    region: String,
    id: String,
    map: Option<String>,
    maxPlayers: u32,
    playerCount: u32,
    mode: String,
    humanCount: u32,
    searchable: bool,
    players: Vec<Player>,
}
#[derive(Debug, Serialize, Deserialize)]
struct Games {
    games: std::collections::HashMap<String, Game>,
}
#[derive(Debug)]
pub struct RelevantGameData {
    pub mode: String,
    pub region: String,
    pub avg_hours_played: f64,
    pub signed_up_players: i32,
    pub human_count: i32,
    pub max_players: i32,
    pub map: String,
}
fn push_game_data(
    res: &mut Vec<RelevantGameData>,
    mode: String,
    region: String,
    avg_hours_played: f64,
    signed_up_players: i32,
    human_count: i32,
    max_players: i32,
    map: String,
) {
    res.push(RelevantGameData {
        mode,
        region,
        avg_hours_played,
        signed_up_players,
        human_count,
        max_players,
        map,
    });
}
async fn avg_hours_played(players: Vec<Player>) -> f64 {
    let mut avg = 0.0;
    let mut shadows = 0;
    if players.len() == 0 {
        return 0.0;
    }
    for player in players.clone() {
        let name = player.username;
        let hours_res = apicalls::get_hours_for_player(name.clone()).await;
        if let Ok(hours) = hours_res {
            if hours == 0.0 {
                shadows += 1;
            }
            avg += hours;
        } else {
            panic!("user {}'s hours played could not be retrieved", name);
        }
    }
    if players.len() == shadows {
        return 0.0;
    }
    return avg / (players.len() as f64 - shadows as f64);
}
pub async fn get_players_and_avg_hours_played_all_lobbies() -> Result<Vec<RelevantGameData>> {
    let url = "https://blocktanks.io/lobby";
    let json: Games;
    let mut res: Vec<RelevantGameData> = Vec::new();
    match reqwest::get(url).await {
        Ok(resp) => {
            json = resp.json().await.unwrap();
            for game in json.games.into_iter() {
                if game.1.searchable == false {
                    continue;
                }
                let mode = game.1.mode;
                let region = game.1.region;
                let max_players = game.1.maxPlayers;
                let map = match game.1.map {
                    Some(map_string) => map_string,
                    None => {
                        continue;
                    }
                };
                let human_count = game.1.humanCount;
                let players = game.1.players;
                let signed_up_players = players.len() as i32;
                let avg_hours_played = avg_hours_played(players);
                push_game_data(
                    &mut res,
                    mode,
                    region,
                    avg_hours_played.await,
                    signed_up_players,
                    human_count as i32,
                    max_players as i32,
                    map,
                );
            }
            return Ok(res);
        }
        Err(err) => {
            println!("Reqwest Error: {:?}", err);
            panic!();
        }
    }
}
