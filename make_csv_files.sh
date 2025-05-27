#!/bin/bash

# Define your function here
make_files() {
    date_str=$(date +"%m-%d-%Y")
    tables=(
    "asia_ctf"
    "asia_dodgeball"
    "asia_ffa"
    "asia_payload"
    "asia_tdm"
    "europe_ctf"
    "europe_dodgeball"
    "europe_ffa"
    "europe_payload"
    "europe_tdm"
    "usa_ctf"
    "usa_dodgeball"
    "usa_ffa"
    "usa_payload"
    "usa_tdm"
    )

    output_dir="data/exports_$date_str"
    mkdir -p "$output_dir"

# Loop through each table and export to CSV
    for table in "${tables[@]}"; do
        echo "Exporting $table..."
        sudo docker exec -i bt_analytics_db \
            psql -U floofydoggo -d bt_analytics \
            -c "\copy (SELECT * FROM $table) TO STDOUT WITH CSV DELIMITER ',' HEADER" \
            | tee "${output_dir}/${table}-${date_str}.csv"
    done
    zip_file="${output_dir}/analytics_export_$date_str.zip"
    zip -j "$zip_file" "${output_dir}"/*.csv
}

# Infinite loop to run the function every 24 hours
while true; do
    make_files
    sleep  86400 # 24 hours in seconds
done
