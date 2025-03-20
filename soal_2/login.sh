#!/bin/bash

PLAYER_DB="data/player.csv"
SALT="arc@eaS3cR3t"

# Fungsi untuk hashing password
hash_password() {
    echo -n "$1$SALT" | sha256sum | awk '{print $1}'
}

# Input email dan password
echo -n "Email: "
read email
echo -n "Password: "
read -s password
echo ""

# Hash password
hashed_password=$(hash_password "$password")

# Cek apakah email dan password cocok dalam database
check=$(awk -F, -v email="$email" -v hash="$hashed_password" '$1==email && $3==hash {print $1}' "$PLAYER_DB")
if [[ "$check" == "$email" ]]; then
    echo "Login berhasil! Selamat datang, Player!"
else
    echo "Login gagal! Periksa kembali email dan password Anda."
fi
