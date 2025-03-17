#!/bin/bash

case "$1" in
    --play="Speak to Me")
        clear
        while true; do
            curl -s https://www.affirmations.dev/ | jq -r '.affirmation'
            sleep 1
        done
        ;;
    --play="On the Run")
        clear
        echo -e "\nSabar Ya Lagi Loading ....."
        progress=0
        bar_length=70  

        while [ $progress -lt 100 ]; do
            sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')

            progress=$((progress + 2))
            if [ $progress -gt 100 ]; then
                progress=100
            fi

            filled_length=$((progress * bar_length / 100))
            
            printf "\r[%-${bar_length}s] %d%%" "$(printf '_%.0s' $(seq 1 $filled_length))" "$progress"
        done

        echo -e "\nSudah Ya Sayang!"
        ;;
    --play="Time")
        clear
        tput civis  
        trap 'tput cnorm; clear' EXIT 

        while true; do
            tput cup 0 0
            date +"%Y-%m-%d %H:%M:%S"
            sleep 1
        done
        ;;
    --play="Money")
        symbols=('$' '€' '£' '¥' '¢' '₹' '₩' '₿' '₣')
        colors=('\e[32m' '\e[33m' '\e[34m' '\e[35m' '\e[36m')  
        echo -ne "\e[?25l"  
        trap 'echo -ne "\e[0m\e[?25h"; clear' EXIT

        cols=$(tput cols)
        lines=$(tput lines)
        declare -A matrix

        for ((i=1; i<=lines; i++)); do
            for ((j=1; j<=cols; j++)); do
                matrix[$i,$j]=" "
            done
        done

        while true; do
            for ((j=1; j<=cols; j++)); do
                if (( RANDOM % 20 == 0 )); then  
                    matrix[1,$j]="${colors[$RANDOM % ${#colors[@]}]}${symbols[$((RANDOM % ${#symbols[@]}))]}\e[0m"
                fi
            done

            for ((i=lines; i>1; i--)); do
                for ((j=1; j<=cols; j++)); do
                    matrix[$i,$j]=${matrix[$((i-1)),$j]}
                done
            done

            for ((j=1; j<=cols; j++)); do
                matrix[1,$j]=" "
            done

            clear
            for ((i=1; i<=lines; i++)); do
                line=""
                for ((j=1; j<=cols; j++)); do
                    line+=${matrix[$i,$j]}
                done
                echo -ne "$line"
            done

            sleep 0.05  
        done
        ;;
	--play="Brain Damage")
        echo "BRAIN DAMAGE ? NIH KULIHATIN"
        sleep 2
	clear

        tput civis

        trap 'tput cnorm; exit' INT

        while true; do
            tput cup 0 0

            free -m | awk 'NR==2{printf "MiB Mem : %s total, %s free, %s used, %s buff/cache\n", $2, $4, $3, $6}'

            echo   

            top -b -n 1 | head -n 20

            sleep 1
        done
        ;;
    *)
        echo "Usage: ./dsotm.sh --play=\"<Track>\""
        echo "Available Tracks:"
        echo "  --play=\"Speak to Me\""
        echo "  --play=\"On the Run\""
        echo "  --play=\"Time\""
        echo "  --play=\"Money\""
        echo "  --play=\"Brain Damage\""
        ;;
esac
