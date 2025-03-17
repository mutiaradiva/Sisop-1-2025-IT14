#!/bin/bash

DB_FILE="./data/player.csv"
SALT="arc@eaS3cR3t"

mkdir -p ./data
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

validate_email() {
    local email="$1"
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}

validate_password() {
    local password="$1"
    if [[ "$password" =~ [A-Z] ]] && [[ "$password" =~ [a-z] ]] && [[ "$password" =~ [0-9] ]] && [[ ${#password} -ge 8 ]]; then
        return 0
    else
        return 1
    fi
}

read -p "Masukkan Email: " email
read -p "Masukkan Username: " username
read -s -p "Masukkan Password: " password
echo ""
read -s -p "Konfirmasi Password: " password_confirm
echo ""

if ! validate_email "$email"; then
    echo "Format email tidak valid."
    exit 1
fi

if ! validate_password "$password"; then
    echo "Password harus memiliki minimal 8 karakter, satu huruf besar, satu huruf kecil, dan satu angka."
    exit 1
fi

if [ "$password" != "$password_confirm" ]; then
    echo "Password tidak cocok!"
    exit 1
fi


if grep -q "^$email," "$DB_FILE"; then
    echo "Email sudah terdaftar!"
    exit 1
fi


hashed_password=$(echo -n "$password$SALT" | sha256sum | awk '{print $1}')

echo "$email,$username,$hashed_password" >> "$DB_FILE"
echo "Registrasi berhasil!"
