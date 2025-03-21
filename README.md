# LAPRES Praktikum Sistem Operasi Modul 1 - IT14

## Anggota
1. Muhammad Fatihul Qolbi Ash Shiddiqi (5027241023)
2. Mutiara Diva Jaladitha (5027241083)
3. M. Faqih Ridho (5027241123)

## DAFTAR ISI
- [Soal 1](#soal-1)
- [Soal 2](#soal-2)
- [Soal 3](#soal-3)
- [Soal 4](#soal-4)

# Soal 1
**DIkerjakan Oleh M Faqih Ridho (5027241123)**

## Deskripsi Soal
1.Poppo dan siroyo memiliki tablet yang didalamnya terdapat file reading_data.csv. Kita disuruh untuk menelusuri file yang ada pada file tersebut dengan kriteria-kriteria tertentu
```
mkdir poppo_siroyo.sh
cd poppo_siroyo.sh
wget --content-disposition "https://drive.google.com/uc?export=download&id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV"
```
Pertama saya membuat file directory. Lalu masuk kedalam directory.Lalu, mendownload file reading_data.csv.

![tahap awal](image_for_readme/Mendownload%20File%20csv%20nomor%201.png)

#### 1. A
Membuat filter dengan kriteria berapa banyak buku yang dibaca oleh Chris Hemsworth di file reading_data.csv
berikut commmand secara keseluruhan yang saya gunakan:
```
awk '{ jumlah +=1; if ($0 ~ /Chris Hemsworth/) { ++n } } END { if (n > 0) print "Chris Hemsworth membaca", n, "buku."; else print "Chris Hemsworth tidak membaca buku."; }' reading_data.csv
```

### Cara Pengerjaan 

```awk
{ jumlah += 1; if ($0 ~ /Chris Hemsworth/) { ++n } }
```
- jumlah += 1: Menambahkan nilai 1 pada variabel jumlah untuk setiap baris yang diproses.

- if ($0 ~ /Chris Hemsworth/) { ++n }: Memeriksa apakah baris tersebut mengandung kata Chris Hemsworth menggunakan pencocokan dengan ekspresi reguler (regex). Jika kondisinya terpenuhi, variabel n akan bertambah satu.

>Catatan: Penggunaan operator ~ memungkinkan pencocokan yang fleksibel, meskipun berdasarkan ketentuan yang ada, penggunaan >operator == mungkin lebih tepat.

```
END { 
    if (n > 0) 
        print "Chris Hemsworth membaca", n, "buku."; 
    else 
        print "Chris Hemsworth tidak membaca buku."; 
}
```
- Jika nilai n lebih besar dari 0, maka akan dicetak pesan:"Chris Hemsworth membaca n buku."
dimana n adalah jumlah kemunculan nama Chris Hemsworth.
- Jika nilai n sama dengan 0, maka akan dicetak pesan: "Chris Hemsworth tidak membaca buku."

### Gambar 

![Setelah If-else](image_for_readme/Nomor%201%20A%20Pakai%20IF-Else.png)

#### 1. B
Siroyo penasaran berapa waktu rata-rata membaca menggunakan perangkat tablet pada file reading_data.csv
   
Berikut command keseluruhan yang saya gunakan :
```
awk 'BEGIN{FS=","} { if ($8 == "Tablet") { total+=$6; hitung++ } }
 END { if (hitung > 0) {print "Rata-rata durasi membaca dengan Tablet adalah", total/hitung, "menit"}
 else{ print "Tidak ada data membaca dengan Tablet." }}' reading_data.csv
```

### Cara Pengerjaan
```
awk 'BEGIN{FS=","} { if ($8 == "Tablet") { total+=$6; hitung++ } 
```

- if ($8 == "Tablet"): Kondisi ini memeriksa apakah kolom ke-8 mengandung kata Tablet.
- total += $6: Jika kondisi terpenuhi, nilai pada kolom ke-6 (yang berisi durasi membaca) akan ditambahkan ke variabel total.
- hitung++: Variabel hitung akan bertambah satu untuk setiap baris data yang memenuhi kondisi, sehingga nantinya dapat digunakan untuk menghitung rata-rata.

```
END { if (hitung > 0) {print "Rata-rata durasi membaca dengan Tablet adalah", total/hitung, "menit"}
 else{ print "Tidak ada data membaca dengan Tablet." }}' reading_data.csv
```
- Jika nilai hitung lebih besar dari 0, maka akan dicetak pesan:
"Rata-rata durasi membaca dengan Tablet adalah total/hitung menit" Dimana total/hitung merupakan hasil perhitungan rata-rata durasi membaca.
- Jika tidak ada baris data yang memenuhi kondisi (nilai hitung tidak lebih besar dari 0), maka akan dicetak:
"Tidak ada data membaca dengan Tablet."

### Gambar

![Setelah If-else](image_for_readme/Nomor%201%20B%20pakai%20if-else.png)


#### 1.C
Poppo mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca (Rating) beserta nama (Name) dan judul bukunya (Book_Title) pada file reading_data.csv
Berikut command secara keseluruhan yang saya gunakan :
```
awk 'BEGIN {FS=","; Maks=0} { if (NR > 1) { if ($7 > Maks) { Maks=$7; nama=$2; JudulBuku=$3 } } }
 END { if (Maks > 0) {print "Pembaca dengan rating tertinggi:", nama, "-", JudulBuku, "-", Maks}
else {print "Tidak ada data rating yang valid." }}' reading_data.csv
```
### Cara Pengerjaan
```
{ if (NR > 1) { if ($7 > Maks) { Maks=$7; nama=$2; JudulBuku=$3 } } }
```
- NR > 1 memastikan bahwa baris pertama (header) dilewati.
  
- Kondisi if ($7 > Maks) memeriksa apakah nilai di kolom 7 lebih besar daripada nilai Maks yang tersimpan.
  
- Jika kondisi terpenuhi, maka:
   -Maks diperbarui dengan nilai baru dari kolom 7.
   -Variabel nama diisi dengan nilai dari kolom 2.
   -Variabel JudulBuku diisi dengan nilai dari kolom 3.

```
END { if (Maks > 0) { print "Pembaca dengan rating tertinggi:", nama, "-", JudulBuku, "-", Maks } else { print "Tidak ada data rating yang valid." } }
```
Setelah seluruh data dibaca, blok END dieksekusi.

- Jika Maks > 0, maka program mencetak pesan yang menampilkan nama pembaca, judul buku, dan rating tertinggi.
  
- Jika tidak ada data rating yang valid (nilai Maks tidak lebih besar dari 0), maka program mencetak pesan "Tidak ada data rating yang valid."
 
### Gambar

![Setelah If-else](image_for_readme/Nomor%201%20C%20Pakai%20if-else.png)

#### 1. D
Siroyo ingin mengetahui berapa buku untuk Genre buku paling populer di Asia setelah 31 Desember 2023 pada file reading_data.csv
```
awk 'BEGIN { FS="," } NR > 1 && $5 > "2023-12-31" && $9 ~ /Asia/ { Ngitung_Genre[$4]++ } END { Jenis_Genre=""; Jumlah_Genre_Terbanyak=0; for (n in Ngitung_Genre) { if (Ngitung_Genre[n] > Jumlah_Genre_Terbanyak) { Jenis_Genre=n; Jumlah_Genre_Terbanyak=Ngitung_Genre[n] } } if (Jumlah_Genre_Terbanyak>0) { print "Genre paling populer di Asia setelah 2023 adalah", Jenis_Genre, "dengan", Jumlah_Genre_Terbanyak, "buku" } else { print "Tidak ada Genre favorit" } }' reading_data.csv
```

### Cara Pengerjaan

```
NR > 1 && $5 > "2023-12-31" && $9 ~ /Asia/ { Ngitung_Genre[$4]++ }
```
- NR > 1 memastikan bahwa baris pertama (header) dilewati.
  
- $5 > "2023-12-31" memastikan hanya data setelah 31 Desember 2023 yang diproses.
  
- $9 ~ /Asia/ memastikan hanya data dengan kata "Asia" dalam kolom 9 yang diproses.

- Jika ketiga kondisi terpenuhi, variabel Ngitung_Genre[$4] (berisi genre dari kolom 4) akan bertambah 1 setiap kali ditemukan genre yang sama.

```
END { Jenis_Genre=""; Jumlah_Genre_Terbanyak=0;
```
- Jenis_Genre="" adalah variabel string untuk menyimpan genre paling populer.
  
- Jumlah_Genre_Terbanyak=0 adalah variabel integer untuk menyimpan jumlah kemunculan terbanyak.

```
for (n in Ngitung_Genre) { if (Ngitung_Genre[n] > Jumlah_Genre_Terbanyak) { Jenis_Genre=n; Jumlah_Genre_Terbanyak=Ngitung_Genre[n] } }
```
- Perulangan for (n in Ngitung_Genre) akan mengiterasi semua genre yang telah dihitung.
- Jika Ngitung_Genre[n] lebih besar dari Jumlah_Genre_Terbanyak, maka:
  - Jenis_Genre diperbarui dengan nama genre yang memiliki jumlah terbanyak.
  - Jumlah_Genre_Terbanyak diperbarui dengan jumlah terbanyak saat ini.
- Perulangan ini memastikan bahwa genre dengan jumlah terbanyak akan tersimpan.

```
if (Jumlah_Genre_Terbanyak>0) { print "Genre paling populer di Asia setelah 2023 adalah", Jenis_Genre, "dengan", Jumlah_Genre_Terbanyak, "buku" } else { print "Tidak ada Genre favorit" } }
```
- Jika Jumlah_Genre_Terbanyak > 0, maka program akan mencetak genre yang paling populer beserta jumlah kemunculannya.
- Jika tidak ada data yang memenuhi kriteria, program akan mencetak "Tidak ada Genre favorit".

### Gambar
![Menggunakan If-else](image_for_readme/Nomor%201%20D%20Kendala%20dan%20hasil.png)

# Soal 2

**Dikerjakan Oleh:**
- Muhammad Fatihul Qolbi Ash Shiddiqi (5027241023)
- Mutiara Diva Jaladitha (5027241083)
- M. Faqih Ridho (5027241123)

## Deskripsi Soal 

Membuat sdua shell script, login.sh dan register.sh, yang dimana database “Player” disimpan di /data/player.csv. Untuk register, parameter yang dipakai yaitu email, username, dan password. Untuk login, parameter yang dipakai yaitu email dan password. Email harus memiliki format yang benar dengan tanda @ dan titik, sementara password harus memiliki minimal 8 karakter, setidaknya satu huruf kecil, satu huruf besar, dan satu angka. Sistem login/register tidak bisa memakai email yang sama (email = unique), tetapi tidak ada pengecekan tambahan untuk username. Password perlu disimpan dalam bentuk yang tidak mudah diakses dan menggunakan algoritma hashing sha256sum yang memakai static salt (bebas). Program ini dijalankan dengan cara ./terminal.sh

#### A. “First Step in a New World”

```bash
nano login.sh
```
- `nano login.sh`: Membuat script logindengan parameter email dan password.

```bash
nano register.sh
```
- `nano register.sh`: Membuat script register dengan parameter email. username, dan password.

```bash
mkdir data && cd data && touch player.csv
```
- `mkdir data`: Membuat folder bernama data
- `cd data`: Masuk ke dalam folder data
- `touch player.csv`: membuat file bernama player.csv

#### B. “Radiant Genesis”

```bash
validate_email() {
    local email="$1"
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}
```
- `^[a-zA-Z0-9._%+-]+`: Karakter sebelum '@' (boleh huruf, angka, titik, underscore, dll).
- `@[a-zA-Z0-9.-]+`: Karakter setelah '@' (harus domain yang valid).
- `\.[a-zA-Z]{2,}$`: Ekstensi domain minimal 2 karakter (misal `.com`, `.id`, `.org`).

```bash
validate_password() {
    local password="$1"
    if [[ "$password" =~ [A-Z] ]] && \
       [[ "$password" =~ [a-z] ]] && \
       [[ "$password" =~ [0-9] ]] && \
       [[ ${#password} -ge 8 ]]; then
        return 0
    else
        return 1
    fi
}
```
- `validate_password()`: Fungsi ini memeriksa apakah password memenuhi kriteria berikut:
✅ Minimal 8 karakter
✅ Memiliki setidaknya 1 huruf besar
✅ Memiliki setidaknya 1 huruf kecil
✅ Memiliki setidaknya 1 angka

#### C. “Unceasing Spirit”

```bash
if grep -q "^$email," "$DB_FILE"; then
    echo "Email sudah terdaftar!"
    exit 1
fi
```
- `grep -q`: Mengecek apakah email sudah ada di file database.
- `^$email,`: Regex yang memastikan hanya mencocokkan email pada awal baris (agar tidak tertukar dengan email yang mirip).

#### D. “The Eternal Realm of Light”

```bash
DB_FILE="./data/player.csv"
SALT="arc@eaS3cR3t"
hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')
```
- `DB_FILE`: Menentukan lokasi file database tempat data pengguna disimpan.
- `SALT`: String tetap yang digunakan sebagai tambahan dalam hashing password untuk meningkatkan keamanan.
- Menggabungkan password dengan `SALT` untuk memperkuat hashing.
- Menggunakan `sha256sum` untuk menghasilkan hash.
- `awk '{print $1}'` mengambil hanya nilai hash tanpa karakter tambahan.

#### E “The Brutality of Glass”
```
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

```
#### penjelasan
1. `#!/bin/bash` Baris ini menandakan bahwa skrip akan dijalankan menggunakan shell Bash.

2. `btop` Perintah ini menjalankan aplikasi btop, sebuah tool monitoring sistem berbasis teks yang menampilkan informasi penggunaan sumber daya secara visual.
   
3. `LOG_DIR="../logs"`  Mendefinisikan path folder logs yang terletak satu tingkat di atas direktori skrip.

4. `LOG_FILE="$LOG_DIR/core.log"` Mendefinisikan file log yang akan digunakan untuk menyimpan data monitoring.

5. `mkdir -p "$LOG_DIR"`  Membuat folder logs jika folder tersebut belum ada. Opsi -p memastikan pembuatan folder induk bila diperlukan.
   
6. `fungsi get_cpu_usage()` 
- Membaca Data CPU: Mengambil baris yang dimulai dengan cpu dari file /proc/stat yang berisi statistik penggunaan CPU.
- Mengonversi ke Array: Data tersebut dipecah menjadi array (CPU_STAT_ARRAY) sehingga setiap nilai bisa diakses secara individual.
- Menghitung Total Waktu CPU: Dengan menggunakan perulangan, skrip menjumlahkan delapan nilai pertama (setelah kata cpu) yang menunjukkan berbagai waktu kerja CPU, sehingga didapat total waktu.
- Mengambil Waktu Idle: Nilai idle diambil dari elemen ke-5 dalam array (indeks 4), karena itulah posisi waktu idle dalam file /proc/stat.
- Menghitung Persentase Penggunaan:Jika terdapat nilai sebelumnya (PREV_TOTAL dan PREV_IDLE), skrip menghitung selisih total waktu dan selisih waktu idle.

7. `Fungsi get_cpu_model`
- Fungsi ini mencari baris pertama yang mengandung kata "model name" di file /proc/cpuinfo.
- Menggunakan `awk` , skrip memisahkan baris tersebut berdasarkan delimiter : dan mengambil bagian kedua, yaitu nama model CPU.
- Hasilnya ditampilkan dengan echo

8. Sisanya sesuai komentar yang ada pada pemrograman.

#### F. “In Grief and Great Delight”
```
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
```

#### Penjelasan
1. `#!/bin/bash` Menentukan bahwa skrip akan dijalankan menggunakan shell Bash.

2. `bpytop` Menjalankan aplikasi bpytop yang menampilkan monitoring sistem secara visual, mirip dengan btop pada skrip sebelumnya.

3. Pengaturan Lokasi Log Menetapkan path folder log (../logs) dan file log (fragment.log) di dalam folder tersebut.

4. `mkdir -p "$LOG_DIR"`  Membuat folder logs jika belum ada, memastikan bahwa lokasi untuk menyimpan log sudah tersedia.

5. `Function get_ram_usage()`
- Mengambil Informasi RAM: Fungsi ini mengambil dua baris penting dari file /proc/meminfo:
MemTotal untuk total memori.MemAvailable untuk memori yang tersedia saat ini.
- Pemrosesan Data: Menggunakan grep dan awk untuk mengekstrak nilai memori (dalam satuan KB).
Nilai-nilai tersebut dikonversi ke MB dengan membagi angka dengan 1024.
Menghitung memori yang telah terpakai dengan mengurangi memori yang tersedia dari total memori.
- Menghitung Persentase: Persentase penggunaan RAM dihitung menggunakan kalkulasi di bc dengan skala dua angka di belakang koma untuk presisi.
- Output:
Fungsi mengeluarkan (echo) nilai persentase penggunaan RAM.

6. `Function get_fragment_count()` 
- Penggunaan vmstat -s:
Fungsi ini menggunakan perintah `vmstat -s` untuk menampilkan statistik memori dalam sistem.
- Mencari Baris Fragmentasi:
Dengan `grep` , mencari baris yang mengandung "fragmented memory" dan mengambil nilai numeriknya dengan `awk`.

> Note:
> - Bagian fragmentasi ini bersifat contoh (placeholder) dan dapat disesuaikan atau dikembangkan lebih lanjut sesuai kebutuhan monitoring fragmentasi di sistem yang digunakan.
-Output:
> - Nilai fragmentasi yang diperoleh kemudian dikembalikan melalui echo.

7. Sisanya sesuai komentar pemrograman.

#### G. “On Fate's Approach”
```
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

```
#### Penjelasan
1. `Display_Banner ()` →  menampilkan animasi menu utama manager.sh agar lebih menarik
2. `Function remove_last_entry()` 
- Input Parameter:Fungsi menerima satu parameter, yaitu string pencarian (search_term), yang akan digunakan untuk menemukan entri yang relevan di crontab.
- Mengambil Isi Crontab:
Menggunakan crontab -l, fungsi mengambil daftar entri yang ada di crontab. Jika crontab kosong, fungsi akan menampilkan pesan "Crontab kosong."
- Mencari Entri yang Sesuai:
Dengan perintah grep, fungsi mencari entri-entri yang mengandung search_term dari daftar crontab.
Jika tidak ditemukan entri yang sesuai, maka akan menampilkan pesan bahwa tidak ada entri yang cocok.
Menghapus Entri Terakhir:
Jika ada entri yang cocok, fungsi mengambil entri terakhir dari hasil pencarian menggunakan tail -n 1 dan menghapusnya dari keseluruhan isi crontab.
Sisanya kemudian disimpan kembali ke crontab dengan perintah crontab -.
- Feedback kepada Pengguna:
Setelah penghapusan, fungsi menampilkan pesan bahwa entri terakhir untuk search_term telah dihapus.

3. Lalu, user dapat memilih menu di display banner

## Revisi No 2G (On Fate's Approach)

##### Kesalahan : Crontab tidak berjalan dan tidak bisa memonitoring CPU & Ram dalam jangka waktu tertentu 
- Hal ini dikarenakan tidak adanya variabel yang mengarahkan crontab ke folder log sehingga output tidak tertampil secara real time

### Output
![image alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Crontab%20no%202%20Salah.png?raw=true)

##### Revisi : Kami sudah menambahkan variabel yang dapat mengarahkan output crontab langsung ke folder log
- 
### Output
![image alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Output%20Speak%20to%20Me.png?raw=true)


#### H “The Disfigured Flow of Time”
Gambar core.log
![Core-log](image_for_readme/Nomor%202%20H%20core.log.png)

Gambar fragment.log
![Fragment-log](image_for_readme/Nomor%202%20H%20fragment.log.png)


#### I “Irruption of New Color”
```
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

```
#### Penjelasan
1. `display_banner` dipanggil untuk membersihkan layar dan menampilkan tampilan grafis (banner) yang menarik.

2. `display_main_menu` kemudian menampilkan daftar opsi yang tersedia, misalnya register akun baru, login, mengakses Crontab Manager, dan keluar dari terminal.

3. Main loop :

Perulangan tak terbatas
(while true; do ... done):

```
read -p "\nEnter option [1-4]: " choice
```
- `read` Perintah ini digunakan untuk membaca input dari pengguna.

-  `-p "\nEnter option [1-4]: ` : Opsi -p memungkinkan kita menampilkan pesan prompt kepada pengguna. D
  
- `choice` Nilai yang dimasukkan oleh pengguna akan disimpan dalam variabel bernama choice sehingga bisa digunakan untuk pengambilan keputusan (misalnya dengan case) di bagian skrip selanjutnya.

# Soal 3

**Dikerjakan Oleh Muhammad Fatihul Qolbi Ash Shiddiqi (5027241023)**

## Deskripsi Soal 

Membuat sebuah script bertemakan setidaknya 5 dari 10 lagu dalam album tersebut. Sebagai Peserta kamu memutuskan untuk memilih Speak to Me, On the Run, Time, Money, dan Brain Damage. Saat program ini dijalankan, terminal harus dibersihkan terlebih dahulu agar tidak mengganggu tampilan dari fungsi fungsi yang kamu buat. Program ini dijalankan dengan cara ./dsotm.sh --play=”<Track>” 

- **Speak to Me**: Menampilkan *word of affirmation* dari API setiap detik  
- **On the Run**: Progress bar dengan interval waktu acak  
- **Time**: Live clock dengan tampilan waktu lengkap  
- **Money**: Matrix effect dengan simbol mata uang  
- **Brain Damage**: Live system monitor seperti task manager  

#### A. Speak to Me - Word of Affirmation

Mengambil data dalam https://github.com/annthurium/affirmations untuk menampilkan word of affirmation setiap detik.

```bash
while true; do
    curl -s https://www.affirmations.dev/ | jq -r '.affirmation'
    sleep 1
done
```

- `clear` → Membersihkan terminal sebelum menampilkan output  
- `while true` → Membuat infinite loop  
- `curl -s` → Mengambil data dari API secara silent (tanpa progress bar)  
- `jq -r '.affirmation'` → Parsing JSON dan ekstrak data `"affirmation"`  
- `sleep 1` → Jeda 1 detik sebelum loop berikutnya  

> Note:
> - Pastikan package jq sudah terinstall (sudo apt install jq)
> - Jika API tidak tersedia, akan muncul error JSON parsing

##### Output 

![image alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Output%20Speak%20to%20Me.png?raw=true)

#### B. On The Run - Progress Bar ( Loading )

```bash
clear
echo -e "\nSabar Ya Lagi Loading ....."
progress=0
bar_length=$(($(tput cols)-10))

while [ $progress -lt 100 ]; do
    sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    
    progress=$((progress + RANDOM%3 + 1))
    [ $progress -gt 100 ] && progress=100
    
    filled=$(printf "_%.0s" $(seq 1 $((progress*bar_length/100))))
    printf "\r[%-${bar_length}s] %d%%" "$filled" "$progress"
done
```


- `tput cols` → Mendapatkan lebar terminal untuk progress bar responsif  
- `awk -v min=0.1 -v max=1 ` → Menghitung waktu `sleep` acak antara 0.1-1 detik  
- `$RANDOM%3 +1` → Increment progress acak (1-3%) per iterasi  
- `printf "_%.0s"` → Membuat string filled dengan karakter `_`  
- `\r` → Kembali ke awal baris untuk update progres  

##### Output 

![image alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Output%20On%20the%20Run.png?raw=true)

## Revisi No 3 (On the Run)

##### Kesalahan : Lebar loading tidak sesuai terminal
```bash
bar_length=70  
```

`bar_length=70` → Menetapkan lebar terminal sepanjang 70

##### Revisi : Menyesuaikan Lebar Loading dengan terminal

- Menggunakan `tput cols` → untuk menentukan panjang progress bar.
- `bar_length=$((term_width - 10))` → berfungsi untuk menentukan panjang maksimum dari progress bar dengan mengurangi 10 karakter dari lebar terminal agar tidak terlalu menempel dengan sebelah ujung terminal 

![image_alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Output%20On%20The%20Run%20Revisi.png?raw=true)

#### C. Time - Waktu berjalan sesuai dengan keadaan saat ini

```bash
clear
tput civis
trap 'tput cnorm; clear' EXIT

while true; do
    tput cup 0 0
    date +"%Y-%m-%d %H:%M:%S"
    sleep 1
done
```

- `tput civis` → Menyembunyikan kursor  
- `trap 'tput cnorm; clear' EXIT` → Mengembalikan kursor saat program berhenti  
- `tput cup 0 0` → Memindahkan kursor ke pojok kiri atas  
- `date +"%Y-%m-%d %H:%M:%S"` → Format waktu lengkap dengan detik  
- `sleep 1` → Update setiap 1 detik  

##### Output

![image alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Ouput%20Time.png?raw=true)

#### D. Money - Membuat Cmatrix dengan simbol Mata Uang

```bash
symbols=('$' '€' '£' '¥' '¢' '₹' '₩' '₿' '₣')
colors=('\e[32m' '\e[33m' '\e[34m' '\e[35m' '\e[36m')
echo -ne "\e[?25l"

cols=$(tput cols)
lines=$(tput lines)
declare -A matrix

for ((i=1; i<=lines; i++)); do
    for ((j=1; j<=cols; j++)); do
        matrix[$i,$j]=" "
    done
done

while true; do
    # Update kolom atas
    for ((j=1; j<=cols; j++)); do
        (( RANDOM % 20 == 0 )) && matrix[1,$j]="${colors[RANDOM%5]}${symbols[RANDOM%9]}\e[0m"
    done
    
    for ((i=lines; i>1; i--)); do
        for ((j=1; j<=cols; j++)); do
            matrix[$i,$j]=${matrix[$((i-1)),$j]}
        done
    done
    

    clear
    for ((i=1; i<=lines; i++)); do
        line=""
        for ((j=1; j<=cols; j++)); do
            line+="${matrix[$i,$j]}"
        done
        echo -n "$line"
    done
    sleep 0.05
done
```

- `matrix 2D array` → Menyimpan status layar  
- `RANDOM % 20` → Probabilitas 5% munculkan simbol baru
- `ANSI color codes` → Menghasilkan warna acak  
- `Double loop` → Menggeser semua karakter ke bawah  
- `sleep 0.05` → jeda sebelum menampilkan simbol lain setiap 0,05 detik

##### Output

![image alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Output%20Money.png?raw=true)

#### E. Brain Damage - Task Manager

```bash
clear
tput civis
trap 'tput cnorm; exit' INT

while true; do
    tput cup 0 0
    echo "===== Memory Usage ====="
    free -m | awk 'NR==2{printf "Total: %sMB | Used: %sMB | Free: %sMB\n", $2, $3, $4}'
    
    echo -e "\n===== Top Processes ====="
    ps -eo pid,%mem,%cpu,comm --sort=-%mem | head -n 10
    
    sleep 1
done
```

- `free -m` → Menampilkan penggunaan memori dalam MB  
- `ps -eo` → Menampilkan daftar proses dengan format khusus  
- `--sort=-%mem` → Mengurutkan proses berdasarkan penggunaan memori tertinggi  
- `tput cup` → Memposisikan kursor untuk refresh layar tanpa `clear` untuk menghindari flicker  

##### Output 

![image alt](https://github.com/mutiaradiva/Sisop-1-2025-IT14/blob/main/image_for_readme/Output%20Brain%20Damage.png?raw=true)


# Soal 4

**Dikerjakan Oleh Mutiara Diva Jaladitha (5027241083)**

## Deskripsi Soal 

Membuat sebuah script bernama pokemon_analysis.sh dengan fitur melihat summary dari data pokemon, mengurutkan pokemon berdasarkan data kolom, mencari nama pokemon tertentu, mencari pokemon berdasarkan filter nama type, error handling, dan help screen yang menarik. Program ini dijalankan dengan cara ./pokemon_analysis.sh -h atau ./pokemon analysis.sh --help.

#### A. Melihat summary dari data

```bash
wget -q "https://drive.usercontent.google.com/u/0/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download" -O pokemon_usage.csv
```

- Mengunduh file `pokemon_usage.csv` dari URL yang diberikan.
- Opsi `-q` membuat wget berjalan tanpa output.
- Opsi `-O` menentukan nama file yang akan disimpan.

```bash
if [ "$COMMAND" == "-i" ] || [ "$COMMAND" == "--info" ]; then
    awk -F',' 'NR > 1 {
        gsub("%", "", $2)

        usage = $2 + 0
        raw = $3 + 0

        if (usage > max2) {
            max2 = usage
            name2 = $1
        }
        if (raw > max3) {
            max3 = raw
            name3 = $1
        }
    }
    END {
        print "Summary of", FILENAME
        print "Highest Adjusted Usage:", name2, "with", max2 "%"
        print "Highest Raw Usage:", name3, "with", max3 " uses"
    }' "$FILE"
```
- Membaca file CSV menggunakan `awk`.
- Menghapus tanda `%` dari kolom 2 (Adjusted Usage).
- Menyimpan Pokémon dengan Adjusted Usage dan Raw Usage tertinggi.

#### Output
![Output Summary Info](./image_for_readme/output_info.png)

#### B. Mengurutkan Pokemon berdasarkan data kolom

```bash
elif [ "$COMMAND" == "-s" ] || [ "$COMMAND" == "--sort" ]; then
```
- Mengecek apakah opsi sorting diberikan (`name`, `usage`, dll.).
- Menggunakan `sort` dengan flag:
  - `-t,` → Menentukan delimiter sebagai koma.
  - `-k` → Menentukan kolom yang akan digunakan untuk sortir.
  - `-n` → Sortir secara numerik.
  - `-r` → Sortir secara menurun (descending).

#### Output
![Output Sort By Usage](./image_for_readme/outpu_sort_by_usage.png)

#### C. Mencari nama Pokemon tertentu

```bash
elif [ "$COMMAND" == "-g" ] || [ "$COMMAND" == "--grep" ]; then
```
- Menggunakan `awk` untuk mencari Pokémon yang namanya sesuai dengan parameter yang diberikan.
- Pencarian bersifat case-insensitive dengan `IGNORECASE=1`.

#### Output
![Output Find Pokemon by Name](./image_for_readme/output_grep.png)

#### D. Mencari Pokemon berdasarkan filter nama type

```bash
elif [ "$COMMAND" == "-f" ] || [ "$COMMAND" == "--filter" ]; then
```
- Menggunakan `awk` untuk mencocokkan Pokémon dengan tipe tertentu.
- Filter mencakup dua kolom tipe Pokemon (kolom 4 dan 5).

#### Output
![Output Find Pokemon by Type Name](./image_for_readme/output_filter.png)

#### E. Error handling

```bash
else
    echo "Error: Invalid command. Use -h or --help for instructions."
    exit 1
fi
```
Jika perintah tidak dikenal, maka akan menampilkan pesan error.

#### Output
![Output Error Handling](./image_for_readme/output_error_handling.png)

#### F. Help screen yang menarik

```bash
show_help() {

    echo "                                                                                                                     "
    echo "                                              =-                                                #@%-.               "
    echo "                                            :#++=                                                 +#:....          "
    echo "                                          .+*::=*-                                                   .......       "
    echo "           .-======:         :==*####+.  =##**=.   -====*#***+                                     .........:.     "
    echo "       .=*+-:::::::=*+.   .%#=::.+#+::+*=+#*+==+*=#%*:::+*..=#    =%#+**=-..                ...............:+::    "
    echo "     *#*:...........:=*.  .%##=..==...:+*=::==-.:+##=...-=..:*.   -%#=..:+##*+**=        =..........-%#-...-=::-   "
    echo "     -@#+:.....:+#*-.:*- .:-%#+......-*#=.--.=:-*#%#-...::..:*+=*++*#+...-#*:..+=       ===:... .....--...===..:... "
    echo "      .%###=...:+-++:-##===::+#:...:**=*=.:+-:==-=##-.......:#=-*-.:-++..:*=..-*           .........-**=..:=-..... "
    echo "       .=*%#=...:*+:-#+:=#=:=:-#:...::=**-.......-**-.:+..::#-.+##*+:-+:.:-:.:*:        ............:::.......... "
    echo "          +%#-...:-*#*:.-*##+.:#::**-:.:-*#*==+#%%#-..=#==*:#:.::-:.:++--....=+         ......:.................  "
    echo "           #@*:..:*%%#:......:*+.:*#%%#+-:::+*: -%%*+=*%###:+#:...:-+=:==...-*.          ......................   "
    echo "           .%@*:..=#%%#=::::=#%=:-*.  +#%%#+*-     -+#-%@@#=:=*##*#%+.:+=..:+-                .....:............   "
    echo "            .@%+:.:*--#%%#**.%%#**=       *%%-           #%##%%#. *%%%%%=..=+                ...................   "
    echo "             -@%=:-**                                                 +@#=-*:                  .**-..............  "
    echo "              +@%%+.                                                   .*@@+  :.                  ...............  "
    echo "                                                                                                   .............   "
    echo "                                                                                                                     "
    echo "Pokemon Analysis Tool"
    echo "Usage: ./pokemon_analysis.sh <file_name> [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help             Display this help message."
    echo "  -i, --info             Display the highest adjusted and raw usage."
    echo "  -s, --sort <method>    Sort the data by the specified column."
    echo "    name                 Sort by Pokemon name."
    echo "    usage                Sort by Adjusted Usage."
    echo "    raw                  Sort by Raw Usage."
    echo "    hp                   Sort by HP."
    echo "    atk                  Sort by Attack."
    echo "    def                  Sort by Defense."
    echo "    spatk                Sort by Special Attack."
    echo "    spdef                Sort by Special Defense."
    echo "    speed                Sort by Speed."
    echo "  -g, --grep <name>      Search for a specific Pokemon sorted by usage."
    echo "  -f, --filter <type>    Filter by type of Pokemon sorted by usage."
    echo ""
}
```
- Fungsi `show_help()` digunakan untuk mencetak petunjuk penggunaan (help screen) saat pengguna menjalankan skrip dengan opsi `-h` atau `--help`.
- ASCII Art berfungsi sebagai elemen visual agar help screen terlihat lebih menarik dan bertema unik
- `echo "Usage: ./pokemon_analysis.sh <file_name> [options]"` menunjukkan format penggunaannya
- `-h` atau `--help` ➔ Menampilkan help screen ini.
- `-i` atau `--info` ➔ Menampilkan Pokémon dengan penggunaan tertinggi (adjusted dan raw).
- `-s` atau `--sort` ➔ Mengurutkan data berdasarkan kolom tertentu (misalnya `hp`, `atk`, dll.).
- `-g` atau `--grep` ➔ Mencari Pokémon tertentu.
- `-f` atau `--filter` ➔ Menyaring data berdasarkan tipe Pokemon.

#### Output
![Output Help Screen](./image_for_readme/output_helpscreen.png)
