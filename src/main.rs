use tokio::time::sleep;
mod apicalls;
mod lobbycalls;
use chrono::{DateTime, Duration, Timelike, Utc};
use sqlx::postgres::PgConnectOptions;
use sqlx::ConnectOptions;
const DEFAULT_PORT: u16 = 5432;
fn get_target_table_name_from_mode_and_region(region: &String, mode: &String) -> String {
    let mut region_clone = region.clone();
    let mut mode_clone = mode.clone();
    if mode == "cp" {
        mode_clone = "payload".to_string()
    }
    if region == "usa-east" {
        region_clone = "usa".to_string();
    }
    return format!("{}_{}", region_clone, mode_clone);
}
#[allow(unreachable_code)]
#[tokio::main]
async fn main() -> Result<(), sqlx::Error> {
    let port = env::var("XXPORT")
        .ok()
        .and_then(|port| port.parse::<u16>().ok())
        .unwrap_or(DEFAULT_PORT);
    let mut conn = PgConnectOptions::new()
        .host("localhost")
        .database(std::env::var("PG_DBNAME").unwrap().as_str())
        .port(port)
        .username(std::env::var("PG_USER").unwrap().as_str())
        .password(std::env::var("PG_PASSWORD").unwrap().as_str())
        .connect()
        .await?;
    sqlx::migrate!("./migrations").run(&mut conn).await?;
    let mut target_dt = get_prev_5_min_dt(Utc::now());
    loop {
        target_dt = target_dt
            .checked_add_signed(Duration::seconds(300))
            .unwrap();
        let diff = (target_dt - Utc::now()).to_std().unwrap();
        sleep(diff).await;
        let a = lobbycalls::get_players_and_avg_hours_played_all_lobbies().await;
        if let Ok(game_vec) = a {
            for game in game_vec {
                let target_table =
                    get_target_table_name_from_mode_and_region(&game.region, &game.mode);
                let query = format!("INSERT INTO {} (time_taken,total_humans,signed_up_players,max_players,avg_hours_played,map) VALUES ($1,$2,$3,$4,$5,$6)",target_table);
                sqlx::query(&query.as_str())
                    .bind(chrono::Utc::now())
                    .bind(game.human_count)
                    .bind(game.signed_up_players)
                    .bind(game.max_players)
                    .bind(game.avg_hours_played)
                    .bind(game.map)
                    .execute(&mut conn)
                    .await?;
            }
        } else {
            println!("failed to get data with error {}",a.unwrap_err());
        }
    }
    Ok(())
}
fn get_prev_5_min_dt(current_dt: DateTime<Utc>) -> DateTime<Utc> {
    let target_dt = current_dt.checked_add_signed(Duration::seconds(1)).unwrap();
    let target_minute = (target_dt.minute() / 5) * 5;

    let target_dt = target_dt.with_minute(target_minute).unwrap();
    target_dt.with_second(0).unwrap()
}
