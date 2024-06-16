use scraper::{Html, Selector};
fn remove_last_12_characters(mut input: String) -> String {
    if input.len() <= 12 {
        String::new()
    } else {
        let len = input.len();
        input.truncate(len - 12);
        input
    }
}
pub async fn get_hours_for_player(player: String) -> Result<f64, reqwest::Error> {
    let url = format!("https://blocktanks.io/user/{}", player)
        .replace('"', "")
        .to_string();
    let response = reqwest::get(url).await?;
    let html = response.text().await?;
    let document = Html::parse_document(&html);
    if document.html().contains("Not Found") || document.html().contains("could not be found") {
        return Ok(0.0);
    }
    let selector = Selector::parse("td").unwrap();
    for element in document.select(&selector) {
        let text = element.text().collect::<Vec<_>>().join("");
        if text.contains("Hours Played") && text.len() < 100 {
            let hoursplayed_string = remove_last_12_characters(text.clone());
            return Ok(hoursplayed_string.parse::<f64>().expect("e"));
        }
    }
    println!("Couldn't get hours played for player {}", player);
    panic!()
}
