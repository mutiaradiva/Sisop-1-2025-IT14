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
## Deskripsi Spal
1.Poppo dan siroyo memiliki tablet yang didalamnya terdapat file reading_data.csv. Kita disuruh untuk menelusuri file yang ada pada 
1.a Membuat filter dengan kriteria berapa banyak buku yang dibaca oleh Chris Hemsworth di file reading_data.csv
berikut commmand secara keseluruhan yang saya gunakan:

```
awk 'BEGIN {FS=","; Maks=0} { if (NR > 1) { if ($7 > Maks) { Maks=$7; nama=$2; JudulBuku=$3 } } }
 END { if (Maks > 0) {print "Pembaca dengan rating tertinggi:", nama, "-", JudulBuku, "-", Maks}
else {print "Tidak ada data rating yang valid." }}' reading_data.csv
```
## Penjelasan:
Saya menggunakan filter awk untuk mencari hal yang kita inginkan. "BEGIN {FS=","; Maks=0}" BEGIN adalah eksekusi yang dijalankan sebelum masuk ke file nya. FS/field separator adalah pemisah kolom dalam kasus ini menggunakan "," .Maks adalah semacam variabel yang di inisialisasi int karena kalau tidak akan secara default string.

"{ if (NR > 1) { if ($7 > Maks) { Maks=$7; nama=$2; JudulBuku=$3 } } }"  adalah filternya. NR >1 berarti pembacaan dimulai dari baris >1 karena baris pertama merupakan string. maks adalah variabel yang menampung setiap baris yang ada pada kolom 7. nama adalah variabel yang menampung baris kolom 2 dan JudulBuku adalah variabel yang menampung baris pada kolom 3. Semua variabel tadi akan berganti nilai ke baris selanjutnya jika "($7 > Maks)" ada rating pada baris selanjutnya yang melebihi pada baris sebelumnya. 

"END { if (Maks > 0) {print "Pembaca dengan rating tertinggi:", nama, "-", JudulBuku, "-", Maks}
else {print "Tidak ada data rating yang valid." }}'" . END akan dijalankan hanya ketika semua input telah dibaca / filter dari begin tadi. Jika maks > 0 maka akan menampilkan kata-kata "Pembaca dengan rating tertinggi:" lalu bisa menampilkan nilai variabel dengan memisahkannya dengan ",". Lalu, masukkan varibel seperti pada contoh yaitu nama. lalu "-". masukkan variabel lagi yaitu JudulBuku.Lalu, "-". MAsukkan variabel lagi yaitu Maks agar sesuai tamplate soal. Jika file <0 , maka akan menampilkan kalimat "Tidak ada data rating yang valid.".

"reading_data.csv" adalah file yang menjadi acuannya

## Kendala
1.saya salah menuliskan nama pembacanya chris hemsworth padahal Chris Hemsworth
2.Saya tidak membaca note dimana harus menggunakan if else

## Solusi 
1. saya meneliti command nya sudah sesuai pada GitHub modul 1 maka saya mencoba melihat soal dan ternyata salah huruf kapital.
2. Saya mengulang dengan menggunakan if-else

## Gambar


# Soal 2


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
