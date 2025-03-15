awk '{ jumlah +=1; if ($0 ~ /Chris Hemsworth/) { ++n } } 
END { if (n > 0) print "Chris Hemsworth membaca", n, "buku."; 
else print "Chris Hemsworth tidak membaca buku."; }' reading_data.csv


awk 'BEGIN{FS=","} { if ($8 == "Tablet") { total+=$6; hitung++ } }
 END { if (hitung > 0) {print "Rata-rata durasi membaca dengan Tablet adalah", total/hitung, "menit"}
 else{ print "Tidak ada data membaca dengan Tablet." }}' reading_data.csv


awk 'BEGIN {FS=","; Maks=0} { if (NR > 1) { if ($7 > Maks) { Maks=$7; nama=$2; JudulBuku=$3 } } }
 END { if (Maks > 0) {print "Pembaca dengan rating tertinggi:", nama, "-", JudulBuku, "-", Maks} 
else {print "Tidak ada data rating yang valid." }}' reading_data.csv

awk 'BEGIN { FS="," } NR > 1 && $5 > "2023-12-31" && $9 ~ /Asia/ { Ngitung_Genre[$4]++ } 
END { Jenis_Genre=""; Jumlah_Genre_Terbanyak=0; for (n in Ngitung_Genre) { if (Ngitung_Genre[n] > Jumlah_Genre_Terbanyak) { Jenis_Genre=n; Jumlah_Genre_Terbanyak=Ngitung_Genre[n] } } if (Jumlah_Genre_Terbanyak>0) { print "Genre paling populer di Asia setelah 2023 adalah", Jenis_Genre, "dengan", Jumlah_Genre_Terbanyak, "buku" } else { print "Tidak ada Genre favorit" } }' reading_data.csv
