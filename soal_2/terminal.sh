#!/bin/bash

# Fungsi untuk menampilkan banner
display_banner() {
    clear
    cat << "EOF"
 _____                                                                                 _____
( ___ )                                                                               ( ___ )
 |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   |
 |   |                                                                                 |   |
 |   |       _____ _   _ _____            _____   _____          ______                |   |
 |   |      |_   _| \ | |_   _|     /\   |  __ \ / ____|   /\   |  ____|   /\          |   |
 |   |        | | |  \| | | |      /  \  | |__) | |       /  \  | |__     /  \         |   |
 |   |        | | | . ` | | |     / /\ \ |  _  /| |      / /\ \ |  __|   / /\ \        |   |
 |   |       _| |_| |\  |_| |_   / ____ \| | \ \| |____ / ____ \| |____ / ____ \       |   |
 |   |      |_____|_|_\_|_____|_/_/__  \_\_|__\_\\_____/_/    \_\______/_/    \_\      |   |
 |   |      |__   __|  ____|  __ \|  \/  |_   _| \ | |   /\   | |                      |   |
 |   |         | |  | |__  | |__) | \  / | | | |  \| |  /  \  | |                      |   |
 |   |         | |  |  __| |  _  /| |\/| | | | | . ` | / /\ \ | |                      |   |
 |   |         | |  | |____| | \ \| |  | |_| |_| |\  |/ ____ \| |____                  |   |
 |   |       __|_|  |______|_|__\_\_|_ |_|_____|_| \_/_/    \_\______|                 |   |
 |   |      |  _ \ / __ \ / ____/ ____/ ____| | | | |                                  |   |
 |   |      | |_) | |  | | (___| (___| (___   | | | |                                  |   |
 |   |      |  _ <| |  | |\___ \\___ \\___ \  | | | |                                  |   |
 |   |      | |_) | |__| |____) |___) |___) | |_|_|_|                                  |   |
 |   |      |____/ \____/|_____/_____/_____/  (_|_|_)                                  |   |
 |   |                                                                                 |   |
 |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___|
(_____)                                                                               (_____)
EOF
}

# Fungsi untuk menampilkan menu utama
display_main_menu() {
    echo "\n+-------------------------------------------+"
    echo "|               ARCAEA TERMINAL            |"
    echo "+-------------------------------------------+"
    echo "| ID  | OPTION                             |"
    echo "+----+--------------------------------------+"
    echo "| 1  | Register New Account                |"
    echo "| 2  | Login to Existing Account           |"
    echo "| 3  | Crontab Manager                    |"
    echo "| 4  | Exit Arcaea Terminal                |"
    echo "+-------------------------------------------+"
}

# Main loop
while true; do
    display_banner
    display_main_menu
    read -p "\nEnter option [1-4]: " choice

    case $choice in
        1)
            # Register New Account
            bash register.sh
            read -p "Press Enter to continue..."
            ;;
        2)
            # Login to Existing Account
            bash login.sh
            read -p "Press Enter to continue..."
            ;;
        3)
            # Crontab Manager
            bash ./scripts/manager.sh
            read -p "Press Enter to continue..."
            ;;
        4)
            # Exit Arcaea Terminal
            echo "Keluar dari Arcaea Terminal..."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid!"
            read -p "Tekan ENTER untuk melanjutkan..."
            ;;
    esac
done
