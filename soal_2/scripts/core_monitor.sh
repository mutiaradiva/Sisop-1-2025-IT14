#!/bin/bash
bpytop

# Path ke folder logs yang berada di luar direktori skrip
LOG_DIR="../logs"
LOG_FILE="$LOG_DIR/core.log"

# Buat folder logs jika belum ada
mkdir -p "$LOG_DIR"

# Fungsi untuk mendapatkan penggunaan CPU menggunakan awk
get_cpu_usage() {
    awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \
    <(grep 'cpu ' /proc/stat) <(sleep 1; grep 'cpu ' /proc/stat)
}

# Fungsi untuk mendapatkan model CPU
get_cpu_model() {
    CPU_MODEL=$(grep -m 1 "model name" /proc/cpuinfo | awk -F ': ' '{print $2}')
    echo "$CPU_MODEL"
}

# Ambil informasi CPU
CPU_USAGE=$(get_cpu_usage)
CPU_MODEL=$(get_cpu_model)

# Format waktu untuk log
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Format output log
LOG_ENTRY="[$TIMESTAMP] - Core Usage [$CPU_USAGE] - Terminal Model [$CPU_MODEL]"

# Simpan log
echo "$LOG_ENTRY" >> "$LOG_FILE"

# Tampilkan hasil di terminal
echo "$LOG_ENTRY"
