#!/bin/bash

# Define your function here
make_files() {
    date_str=$(date +"%m-%d-%Y")
    tables=(
    "asia_ctf"
    "asia_ffa"
    "asia_payload"
    "asia_tdm"
    "europe_ctf"
    "europe_ffa"
    "europe_payload"
    "europe_tdm"
    "usa_ctf"
    "usa_ffa"
    "usa_payload"
    "usa_tdm"
    )

    output_dir="data/exports"
    rm -rf "$output_dir"
    rm "data/output.zip"
    mkdir -p "$output_dir"

# Loop through each table and export to CSV
    for table in "${tables[@]}"; do
        echo "Exporting $table..."
        sudo docker exec -i bt_analytics_db \
            psql -U floofydoggo -d bt_analytics \
            -c "\copy (SELECT * FROM $table) TO STDOUT WITH CSV DELIMITER ',' HEADER" \
            | tee "${output_dir}/${table}-${date_str}.csv"
    done
    zip_file="data/output.zip"
    zip -j "$zip_file" "${output_dir}"/*.csv
}

mkdir data
touch data/output.zip
touch data/index.html
touch /server.pid
cat <<EOF > data/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Download Latest Analytics Data</title>
</head>
<body style="display:flex;justify-content:center;align-items:center;height:100vh;">
    <a href="/output.zip" download>
        <button style="padding:1em 2em;font-size:1.2em;">Download ZIP</button>
    </a>
</body>
</html>
EOF

cd data || exit
nohup python3 -m http.server 8000 --bind 0.0.0.0 > server.log 2>&1 &
echo $! > ../server.pid
cd ../ || exit

# Infinite loop to run the function every 24 hours
while true; do
    make_files
    sleep  30 # 24 hours in seconds
done
