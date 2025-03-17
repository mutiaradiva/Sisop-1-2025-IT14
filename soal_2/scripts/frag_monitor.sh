#!/bin/bash
bpytop

# Path ke folder logs yang berada di luar direktori skrip
LOG_DIR="../logs"
LOG_FILE="$LOG_DIR/fragment.log"

# Buat folder logs jika belum ada
mkdir -p "$LOG_DIR"

# Fungsi untuk mendapatkan penggunaan RAM
get_ram_usage() {
    # Baca informasi RAM dari /proc/meminfo
    RAM_INFO=$(grep -E 'MemTotal|MemAvailable' /proc/meminfo)
    TOTAL_RAM=$(echo "$RAM_INFO" | grep 'MemTotal' | awk '{print $2}')
    AVAILABLE_RAM=$(echo "$RAM_INFO" | grep 'MemAvailable' | awk '{print $2}')

    # Konversi dari KB ke MB
    TOTAL_RAM=$((TOTAL_RAM / 1024))
    AVAILABLE_RAM=$((AVAILABLE_RAM / 1024))
    USED_RAM=$((TOTAL_RAM - AVAILABLE_RAM))

    # Hitung persentase penggunaan RAM
    RAM_USAGE_PERCENT=$(echo "scale=2; ($USED_RAM / $TOTAL_RAM) * 100" | bc)

    echo "$RAM_USAGE_PERCENT"
}

# Fungsi untuk mendapatkan fragmentasi RAM
get_fragment_count() {
    # Contoh: Hitung fragmentasi RAM (ini hanya contoh, Anda bisa menyesuaikan dengan kebutuhan)
    FRAGMENT_COUNT=$(vmstat -s | grep "fragmented memory" | awk '{print $1}')
    echo "$FRAGMENT_COUNT"
}

# Ambil informasi RAM
RAM_USAGE=$(get_ram_usage)
FRAGMENT_COUNT=$(get_fragment_count)

# Format waktu untuk log
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Format output log
LOG_ENTRY="[$TIMESTAMP] - Fragment Usage [$RAM_USAGE%] - Fragment Count [$FRAGMENT_COUNT MB] - Details [Total: $TOTAL_RAM MB, Available: $AVAILABLE_RAM MB]"

# Simpan log
echo "$LOG_ENTRY" >> "$LOG_FILE"

# Tampilkan hasil di terminal
echo "$LOG_ENTRY"
