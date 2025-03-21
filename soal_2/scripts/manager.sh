#!/bin/bash

# ===================== KONFIGURASI PATH ABSOLUT =====================
PROJECT_ROOT="/path/to/project"  # Ganti dengan path absolut ke folder project Anda
SCRIPTS_DIR="$PROJECT_ROOT/scripts"
LOGS_DIR="$PROJECT_ROOT/logs"

CPU_MONITOR_SCRIPT="$SCRIPTS_DIR/core_monitor.sh"
RAM_MONITOR_SCRIPT="$SCRIPTS_DIR/frag_monitor.sh"

# ========================= FUNGSI UTAMA =============================

show_menu() {
    echo "Crontab Manager"
    echo "1. Add CPU [Core] Usage Monitoring"
    echo "2. Remove CPU [Core] Usage Monitoring"
    echo "3. Add RAM [Fragment] Usage Monitoring"
    echo "4. Remove RAM [Fragment] Usage Monitoring"
    echo "5. View Active Jobs"
    echo "6. Exit"
    read -p "Pilih opsi: " choice
}

add_cpu_monitor() {
    cron_job="* * * * * $PWD/scripts/core_monitor.sh >> $PWD/logs/core.log"
    (crontab -l; echo "$cron_job") | crontab -
    echo "CPU monitoring ditambahkan ke crontab."
}

remove_cpu_monitor() {
    crontab -l | grep -v "core_monitor.sh" | crontab -
    echo "CPU monitoring dihapus dari crontab."
}

add_ram_monitor() {
    cron_job="* * * * * $PWD/scripts/frag_monitor.sh >> $PWD/logs/fragment.log"
    (crontab -l; echo "$cron_job") | crontab -
    echo "RAM monitoring ditambahkan ke crontab."
}

remove_ram_monitor() {
    crontab -l | grep -v "frag_monitor.sh" | crontab -
    echo "RAM monitoring dihapus dari crontab."
}

view_jobs() {
    crontab -l
}

while true; do
    show_menu
    case $choice in
        1) add_cpu_monitor ;;
        2) remove_cpu_monitor ;;
        3) add_ram_monitor ;;
        4) remove_ram_monitor ;;
        5) view_jobs ;;
        6) echo "Keluar."; exit 0 ;;
        *) echo "Pilihan tidak valid." ;;
    esac
done
