#!/bin/bash

# Lokasi script pemantauan CPU dan RAM
CPU_MONITOR="./scripts/core_monitor.sh"
RAM_MONITOR="./scripts/frag_monitor.sh"

# Menampilkan menu utama
display_banner() {
    clear
    echo "/*  .--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--.  */"
    echo "/* / .. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \ */"
    echo "/* \ \/\`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \/ / */"
    echo "/*  \/ /\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\/ /  */"
    echo "/*  / /\                                                                / /\  */"
    echo "/* / /\ \                                                              / /\ \ */"
    echo "/* \ \/ /        _     ____    ____     _     _____     _              \ \/ / */"
    echo "/*  \/ /        / \   |  _ \  / ___|   / \   | ____|   / \              \/ /  */"
    echo "/*  / /\       / _ \  | |_) || |      / _ \  |  _|    / _ \             / /\  */"
    echo "/* / /\ \     / ___ \ |  _ < | |___  / ___ \ | |___  / ___ \           / /\ \ */"
    echo "/* \ \/ /    /_/   \_\|_| \_\ \____|/_/   \_\|_____|/_/   \_\          \ \/ / */"
    echo "/*  \/ /      ____ __   __ ____  _____  _____  __  __                   \/ /  */"
    echo "/*  / /\     / ___|\ \ / // ___||_   _|| ____||  \/  |                  / /\  */"
    echo "/* / /\ \    \___ \ \ V / \___ \  | |  |  _|  | |\/| |                 / /\ \ */"
    echo "/* \ \/ /     ___) | | |   ___) | | |  | |___ | |  | |                 \ \/ / */"
    echo "/*  \/ /     |____/  |_|  |____/  |_|  |_____||_|  |_|                  \/ /  */"
    echo "/*  / /\      __  __     _     _   _     _     ____  _____  ____        / /\  */"
    echo "/* / /\ \    |  \/  |   / \   | \ | |   / \   / ___|| ____||  _ \      / /\ \ */"
    echo "/* \ \/ /    | |\/| |  / _ \  |  \| |  / _ \ | |  _ |  _|  | |_) |     \ \/ / */"
    echo "/*  \/ /     | |  | | / ___ \ | |\  | / ___ \| |_| || |___ |  _ <       \/ /  */"
    echo "/*  / /\     |_|  |_|/_/   \_\|_| \_|/_/   \_\\____||_____||_| \_\      / /\  */"
    echo "/* / /\ \                                                              / /\ \ */"
    echo "/* \ \/ /                                                              \ \/ / */"
    echo "/*  \/ /                                                                \/ /  */"
    echo "/*  / /\.--..--..--..--..--..--..--..--..--..--..--..--..--..--..--..--./ /\  */"
    echo "/* / /\ \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \.. \/\ \ */"
    echo "/* \ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`'\ \`' / */"
    echo "/*  \`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'\`--'  */"
}

# Fungsi untuk menghapus entri terakhir dari crontab
remove_last_entry() {
    local search_term=$1
    local crontab_content=$(crontab -l 2>/dev/null)

    # Jika crontab tidak kosong
    if [[ -n "$crontab_content" ]]; then
        # Cari semua entri yang sesuai dengan search_term
        local entries=$(echo "$crontab_content" | grep "$search_term")

        # Jika ada entri yang sesuai
        if [[ -n "$entries" ]]; then
            # Ambil semua kecuali entri terakhir
            local new_crontab=$(echo "$crontab_content" | grep -v "$(echo "$entries" | tail -n 1)")

            # Perbarui crontab
            echo "$new_crontab" | crontab -
            echo "Entri terakhir untuk '$search_term' telah dihapus dari Crontab."
        else
            echo "Tidak ada entri yang sesuai dengan '$search_term' di Crontab."
        fi
    else
        echo "Crontab kosong."
    fi
}

while true; do
    display_banner
    echo "┌────────────────────────────────────────┐"
    echo "│           ARCAEA TERMINAL              │"
    echo "├────┬───────────────────────────────────┤"
    echo "│ ID │ OPTION                            │"
    echo "├────┼───────────────────────────────────┤"
    echo "│ 1  │ Add CPU - Core Monitor to Crontab │"
    echo "│ 2  │ Add RAM - Fragment Monitor        │"
    echo "│ 3  │ Remove CPU - Core Monitor         │"
    echo "│ 4  │ Remove RAM - Fragment Monitor     │"
    echo "│ 5  │ View All Scheduled Jobs           │"
    echo "│ 6  │ Exit Arcaea Terminal              │"
    echo "└────┴───────────────────────────────────┘"
    read -p "Enter option [1-6]: " option

    case $option in
        1)
            # Menambahkan CPU Monitor ke Crontab (Setiap 1 menit)
            (crontab -l 2>/dev/null; echo "* * * * * $CPU_MONITOR") | crontab -
            echo "CPU Monitor telah ditambahkan ke Crontab."
            ;;
        2)
            # Menambahkan RAM Monitor ke Crontab (Setiap 1 menit)
            (crontab -l 2>/dev/null; echo "* * * * * $RAM_MONITOR") | crontab -
            echo "RAM Monitor telah ditambahkan ke Crontab."
            ;;
        3)
            # Menghapus entri terakhir untuk CPU Monitor dari Crontab
            remove_last_entry "$CPU_MONITOR"
            ;;
        4)
            # Menghapus entri terakhir untuk RAM Monitor dari Crontab
            remove_last_entry "$RAM_MONITOR"
            ;;
        5)
            # Menampilkan daftar Crontab aktif
            echo "Daftar Crontab Aktif:"
            crontab -l
            ;;
        6)
            echo "Keluar dari Arcaea Terminal..."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid!"
            ;;
    esac
    read -p "Tekan ENTER untuk kembali ke menu..."
done
