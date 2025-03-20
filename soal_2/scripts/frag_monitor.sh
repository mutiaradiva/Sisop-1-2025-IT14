#!/bin/bash
bpytop

# Path ke folder logs
LOG_DIR="../logs"
LOG_FILE="$LOG_DIR/fragment.log"

# Buat folder logs jika belum ada
mkdir -p "$LOG_DIR"

# Fungsi untuk mendapatkan penggunaan RAM menggunakan awk
get_ram_usage() {
    awk '
    /MemTotal/ {total=$2}
    /MemAvailable/ {available=$2}
    END {
        if (total > 0) {
            usage_percent = ((total - available) / total) * 100
            printf "%.2f %d %d\n", usage_percent, total/1024, available/1024
        } else {
            print "N/A N/A N/A"
        }
    }' /proc/meminfo
}

# Fungsi untuk mendapatkan jumlah fragmentasi dalam MB menggunakan awk
get_fragment_count() {
    awk '
    BEGIN { fragment_mb = 0; split("4 8 16 32 64 128 256 512 1024 2048", block_sizes) }
    {
        for (i = 3; i <= NF; i++) {
            fragment_mb += $i * block_sizes[i - 2] / 1024
        }
    }
    END { print fragment_mb }' /proc/buddyinfo
}

# Ambil informasi RAM
RAM_INFO=$(get_ram_usage)
RAM_USAGE=$(echo "$RAM_INFO" | awk '{print $1}')
TOTAL_RAM=$(echo "$RAM_INFO" | awk '{print $2}')
AVAILABLE_RAM=$(echo "$RAM_INFO" | awk '{print $3}')

# Ambil informasi fragmentasi dalam MB
FRAGMENT_COUNT_MB=$(get_fragment_count)

# Format tampilan jika data tidak tersedia
if [[ "$TOTAL_RAM" == "N/A" || "$AVAILABLE_RAM" == "N/A" ]]; then
    TOTAL_RAM_DISPLAY="N/A"
    AVAILABLE_RAM_DISPLAY="N/A"
else
    TOTAL_RAM_DISPLAY="${TOTAL_RAM} MB"
    AVAILABLE_RAM_DISPLAY="${AVAILABLE_RAM} MB"
fi

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

LOG_ENTRY="[$TIMESTAMP] - Fragment Usage [$RAM_USAGE%] - Fragment Count [$FRAGMENT_COUNT_MB MB] - Details [Total: $TOTAL_RAM_DISPLAY, Available: $AVAILABLE_RAM_DISPLAY]"

echo "$LOG_ENTRY" >> "$LOG_FILE"
echo "$LOG_ENTRY"
