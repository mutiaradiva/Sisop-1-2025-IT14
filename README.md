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
1.Poppo dan siroyo memiliki tablet yang didalamnya terdapat file reading_data.csv. Kita disuruh untuk menelusuri file yang ada pada 
```
mkdir poppo_siroyo.sh
cd poppo_siroyo.sh
wget --content-disposition "https://drive.google.com/uc?export=download&id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV"
```
Pertama saya membuat file directory. Lalu masuk kedalam directory.Lalu, mendownload file reading_data.csv.

![tahap awal](image_for_readme/Mendownload%20File%20csv%20nomor%201.png)

#### 1. A
1. A Membuat filter dengan kriteria berapa banyak buku yang dibaca oleh Chris Hemsworth di file reading_data.csv
berikut commmand secara keseluruhan yang saya gunakan:
```
awk '{ jumlah +=1; if ($0 ~ /Chris Hemsworth/) { ++n } } END { if (n > 0) print "Chris Hemsworth membaca", n, "buku."; else print "Chris Hemsworth tidak membaca buku."; }' reading_data.csv
```

### Cara Pengerjaan 
" '{ jumlah +=1; if ($0 ~ /Chris Hemsworth/) { ++n } }" adalah inisialisasi awal sebelum membaca input dibaca. Jumlah adalah semacam variabel yang akan bertambah 1 Jika apakah seluruh baris menggandung kata Chris Hemsworth , jika iya n akan bertambah dengan menampung angkanya. kenapa menggunakan ~ (regex) bukan == karena regex lebih fleksibel jika dengan huruf besar dan kecil walaupun saya mengakui itu kesalahan karena lebih bagus mengguakan == agar sesuai ketentuan.

"END { if (n > 0) print "Chris Hemsworth membaca", n, "buku."; else print "Chris Hemsworth tidak membaca buku."; }'"
setelah input sudah dibaca (END), maka berlaku ketentuan. Jika N > 0 (penambahan setiap bertemu nama Chris Hemsworth) maka mencetak "Chris Hemsworth membaca", n, "buku." dengan n adalah variabel yang menampung jumlah bukunya. jika tidak maka tercetak kalimat "Chris Hemsworth tidak membaca buku.".

"reading_data.csv" adalah file yang di baca.

### Kendala
 1.saya salah menuliskan nama pembacanya chris hemsworth padahal Chris Hemsworth
 2. Saya tidak membaca note dimana harus menggunakan if else

### Solusi
1. saya meneliti command nya sudah sesuai pada GitHub modul 1 maka saya mencoba melihat soal dan ternyata salah huruf kapital.
2. Saya menata ulang lagi command nya agar mengandung if-else

### Gambar 


#### 1. B
1. B Siroyo penasaran berapa waktu rata-rata membaca menggunakan perangkat tablet pada file reading_data.csv
   
Berikut command keseluruhan yang saya gunakan :
```
awk 'BEGIN{FS=","} { if ($8 == "Tablet") { total+=$6; hitung++ } }
 END { if (hitung > 0) {print "Rata-rata durasi membaca dengan Tablet adalah", total/hitung, "menit"}
 else{ print "Tidak ada data membaca dengan Tablet." }}' reading_data.csv
```

### Cara Pengerjaan
" 'BEGIN{FS=","} { if ($8 == "Tablet") { total+=$6; hitung++ } } " command awal BEGIN digunakan untuk eksekusi sebelum file dibaca.FS/field separator adalah pemisah kolom dalam kasus ini menggunakan "," .  " if ($8 == "Tablet") { total+=$6; hitung++ }" Jika kolom 8 mengandung kata Tablet, maka variabel total yang menampung kolom 6 yang berisi durasi membaca akan terus bertambah. Lalu variabel hitung++ menambahkan jumlah baris agar dapat menghitung rata-ratanya.

"END { if (hitung > 0) {print "Rata-rata durasi membaca dengan Tablet adalah", total/hitung, "menit"}
 else{ print "Tidak ada data membaca dengan Tablet." }}'"  Setelah input sudah dibaca (END) , berlaku ketentuan. Jika hitung >0 maka cetak "Rata-rata durasi membaca dengan Tablet adalah", total/hitung, "menit" dimana total : hitung adalah menghitung rata-rata durasi membaca. Jika hitung  < 0 maka mencetak "Tidak ada data membaca dengan Tablet.".

 "reading_data.csv" adalah file data yang dibaca

 ### Kendala
 1.saya bingung apa yang membuat perintah menggunakan {} dan tidak , karena $8 =="Tablet" tidak menggunakan {} saya mencontohnya pada modul GitHub NR==2.
2.Saya tidak membaca note terakhir

### Solusi 
1. saya menemukan pada website geeksforgeeks bahwa penyusunan awk adalah
awk [options] 'pattern { action }' input-file(s). dimana patern adalah kondisi yang dicek setiap barisnya dan action merupakan eksekusi dengan syarat pattern terpenuhi
2. Saya Menyesuaikan command agar menggunakan if-else

### Gambar


#### 1.C
1.C Poppo mencari siapa yang memberikan rating tertinggi untuk buku yang dibaca (Rating) beserta nama (Name) dan judul bukunya (Book_Title) pada file reading_data.csv
Berikut command secara keseluruhan yang saya gunakan :
```
awk 'BEGIN {FS=","; Maks=0} { if (NR > 1) { if ($7 > Maks) { Maks=$7; nama=$2; JudulBuku=$3 } } }
 END { if (Maks > 0) {print "Pembaca dengan rating tertinggi:", nama, "-", JudulBuku, "-", Maks}
else {print "Tidak ada data rating yang valid." }}' reading_data.csv
```
### Cara Pengerjaan

Saya menggunakan filter awk untuk mencari hal yang kita inginkan. "BEGIN {FS=","; Maks=0}" BEGIN adalah eksekusi yang dijalankan sebelum masuk ke file nya. FS/field separator adalah pemisah kolom dalam kasus ini menggunakan "," .Maks adalah semacam variabel yang di inisialisasi int karena kalau tidak akan secara default string.

"{ if (NR > 1) { if ($7 > Maks) { Maks=$7; nama=$2; JudulBuku=$3 } } }"  adalah filternya. NR >1 berarti pembacaan dimulai dari baris >1 karena baris pertama merupakan string. maks adalah variabel yang menampung setiap baris yang ada pada kolom 7. nama adalah variabel yang menampung baris kolom 2 dan JudulBuku adalah variabel yang menampung baris pada kolom 3. Semua variabel tadi akan berganti nilai ke baris selanjutnya jika "($7 > Maks)" ada rating pada baris selanjutnya yang melebihi pada baris sebelumnya. 

"END { if (Maks > 0) {print "Pembaca dengan rating tertinggi:", nama, "-", JudulBuku, "-", Maks}
else {print "Tidak ada data rating yang valid." }}'" . END akan dijalankan hanya ketika semua input telah dibaca / filter dari begin tadi. Jika maks > 0 maka akan menampilkan kata-kata "Pembaca dengan rating tertinggi:" lalu bisa menampilkan nilai variabel dengan memisahkannya dengan ",". Lalu, masukkan varibel seperti pada contoh yaitu nama. lalu "-". masukkan variabel lagi yaitu JudulBuku.Lalu, "-". MAsukkan variabel lagi yaitu Maks agar sesuai tamplate soal. Jika file <0 , maka akan menampilkan kalimat "Tidak ada data rating yang valid.".

"reading_data.csv" adalah file yang menjadi acuannya

### Kendala
1.saya salah penulisan pemanggian variable ternyata awk itu case sensitive
2. Saya awalnya tidak menyimpan kolom 2 dan 3 dalam variable sehingga tidak tercetak sebagai syarat rating tertinggi malah mencetak baris terakhir makanya saya menambahkan variabel
3. Saya awalnya tidak menggunakan FS sebagai pemisah kolom jadi outputnya tidak jelas
4. perbandingan kolom ke 7 yaitu rating awalnya terhambat karena baris pertama adalah string sehingga baris lain tidak dieksekusi jadi saya memutuskan untuk melewati baris pertama.

### Solusi 
1. 
   
### Gambar


#### 1. D
1.D Siroyo ingin mengetahui berapa buku untuk Genre buku paling populer di Asia setelah 31 Desember 2023 pada file reading_data.csv
```
awk 'BEGIN { FS="," } NR > 1 && $5 > "2023-12-31" && $9 ~ /Asia/ { Ngitung_Genre[$4]++ } END { Jenis_Genre=""; Jumlah_Genre_Terbanyak=0; for (n in Ngitung_Genre) { if (Ngitung_Genre[n] > Jumlah_Genre_Terbanyak) { Jenis_Genre=n; Jumlah_Genre_Terbanyak=Ngitung_Genre[n] } } if (Jumlah_Genre_Terbanyak>0) { print "Genre paling populer di Asia setelah 2023 adalah", Jenis_Genre, "dengan", Jumlah_Genre_Terbanyak, "buku" } else { print "Tidak ada Genre favorit" } }' reading_data.csv
```
### Cara Pengerjaan




### Kendala
1. pada penulisan saya karena menggunakan 1 line itu ada yang terpenggal variable nya an tidak dapat dieksekusi

### Solusi 
1. saya membentuk Jarak dengan spasi sehingga tidak terpenggal dan dapat dieksekusi

### Gambar

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

**Dikerjakan Oleh Mutiara Diva Jaladitha (5027241083)**

## Deskripsi Soal 

Membuat sebuah script bernama pokemon_analysis.sh dengan fitur melihat summary dari data pokemon, mengurutkan pokemon berdasarkan data kolom, mencari nama pokemon tertentu, mencari pokemon berdasarkan filter nama type, error handling, dan help screen yang menarik. Program ini dijalankan dengan cara ./pokemon_analysis.sh -h atau ./pokemon analysis.sh --help.

#### A. Melihat summary dari data

#### B. Mengurutkan Pokemon berdasarkan data kolom

#### C. Mencari nama Pokemon tertentu

#### D. Mencari Pokemon berdasarkan filter nama type

#### E. Error handling

#### F. Help screen yang menarik
