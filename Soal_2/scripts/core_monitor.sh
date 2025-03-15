#!/bin/bash
btop

# Path ke folder logs yang berada di luar direktori skrip
LOG_DIR="../logs"
LOG_FILE="$LOG_DIR/core.log"

# Buat folder logs jika belum ada
mkdir -p "$LOG_DIR"

# Fungsi untuk mendapatkan penggunaan CPU
get_cpu_usage() {
    # Baca stat CPU dari /proc/stat
    CPU_STAT=$(grep '^cpu ' /proc/stat)
    CPU_STAT_ARRAY=($CPU_STAT)

    # Hitung total waktu CPU
    TOTAL=0
    for value in "${CPU_STAT_ARRAY[@]:1:8}"; do
        TOTAL=$((TOTAL + value))
    done
    IDLE=${CPU_STAT_ARRAY[4]}

    # Hitung perubahan dan persentase penggunaan CPU
    if [[ -n "$PREV_TOTAL" && -n "$PREV_IDLE" ]]; then
        DIFF_TOTAL=$((TOTAL - PREV_TOTAL))
        DIFF_IDLE=$((IDLE - PREV_IDLE))
        DIFF_USAGE=$(( (100 * (DIFF_TOTAL - DIFF_IDLE)) / DIFF_TOTAL ))
    else
        DIFF_USAGE=0
    fi

    # Simpan nilai saat ini untuk penggunaan berikutnya
    PREV_TOTAL=$TOTAL
    PREV_IDLE=$IDLE

    echo "$DIFF_USAGE"
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
LOG_ENTRY="[$TIMESTAMP] - Core Usage [$CPU_USAGE%] - Terminal Model [$CPU_MODEL]"

# Simpan log
echo "$LOG_ENTRY" >> "$LOG_FILE"

# Tampilkan hasil di terminal
echo "$LOG_ENTRY"
