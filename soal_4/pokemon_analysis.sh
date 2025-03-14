#!/bin/bash

wget -q  "https://drive.usercontent.google.com/u/0/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download" -O pokemon_usage.csv

# ASCII Art (Help Screen)
show_help() {

#!/bin/bash

    echo "                                                                                                                     "
    echo "                                              =-                                                #@%-.               "
    echo "                                            :#++=                                                 +#:....          "
    echo "                                          .+*::=*-                                                   .......       "
    echo "           .-======:         :==*####+.  =##**=.   -====*#***+                                     .........:.     "
    echo "       .=*+-:::::::=*+.   .%#=::.+#+::+*=+#*+==+*=#%*:::+*..=#    =%#+**=-..                ...............:+::    "
    echo "     *#*:...........:=*.  .%##=..==...:+*=::==-.:+##=...-=..:*.   -%#=..:+##*+**=        =..........-%#-...-=::-   "
    echo "     -@#+:.....:+#*-.:*- .:-%#+......-*#=.--.=:-*#%#-...::..:*+=*++*#+...-#*:..+=       ===:... .....--...===..:..."
    echo "      .%###=...:+-++:-##===::+#:...:**=*=.:+-:==-=##-.......:#=-*-.:-++..:*=..-*           .........-**=..:=-..... "
    echo "       .=*%#=...:*+:-#+:=#=:=:-#:...::=**-.......-**-.:+..::#-.+##*+:-+:.:-:.:*:        ............:::.........."
    echo "          +%#-...:-*#*:.-*##+.:#::**-:.:-*#*==+#%%#-..=#==*:#:.::-:.:++--....=+         ......:................. "
    echo "           #@*:..:*%%#:......:*+.:*#%%#+-:::+*: -%%*+=*%###:+#:...:-+=:==...-*.          ......................  "
    echo "           .%@*:..=#%%#=::::=#%=:-*.  +#%%#+*-     -+#-%@@#=:=*##*#%+.:+=..:+-                .....:............  "
    echo "            .@%+:.:*--#%%#**.%%#**=       *%%-           #%##%%#. *%%%%%=..=+                ...................  "
    echo "             -@%=:-**                                                 +@#=-*:                  .**-.............. "
    echo "              +@%%+.                                                   .*@@+  :.                  ............... "
    echo "                                                                                                   ............. "
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

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_help
    exit 0
fi

# Error handling
if [ "$#" -lt 2 ]; then
    echo "Error. \nUse -h or --help for help."
    exit 1
fi

FILE=$1
COMMAND=$2
OPTION=$3

# Info
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

# Sorting
elif [ "$COMMAND" == "-s" ] || [ "$COMMAND" == "--sort" ]; then
    if [ -z "$OPTION" ]; then
        echo "Error: No sorting column provided."; exit 1
    else
        header=$(awk 'NR==1' "$FILE")
        data=$(awk 'NR>1' "$FILE")

        case "$OPTION" in
            usage)
                sorted_data=$(echo "$data" | sort -t, -k2 -n -r)
                ;;
            raw)
                sorted_data=$(echo "$data" | sort -t, -k3 -n -r)
                ;;
            name)
                sorted_data=$(echo "$data" | sort -t, -k1)
                ;;
            hp)
                sorted_data=$(echo "$data" | sort -t, -k6 -n -r)
                ;;
            atk)
                sorted_data=$(echo "$data" | sort -t, -k7 -n -r)
                ;;
            def)
                sorted_data=$(echo "$data" | sort -t, -k8 -n -r)
                ;;
            spatk)
                sorted_data=$(echo "$data" | sort -t, -k9 -n -r)
                ;;
            spdef)
                sorted_data=$(echo "$data" | sort -t, -k10 -n -r)
                ;;
            speed)
                sorted_data=$(echo "$data" | sort -t, -k11 -n -r)
                ;;
            *)
                echo "Error: Invalid sorting column."; exit 1
                ;;
        esac

        echo "$header"
        echo "$sorted_data"
    fi

# Grep
elif [ "$COMMAND" == "-g" ] || [ "$COMMAND" == "--grep" ]; then
    if [ -z "$OPTION" ]; then
        echo "Error: No search term provided."; exit 1
    else
        header=$(awk 'NR==1' "$FILE")
        result=$(awk -F',' -v name="$OPTION" 'BEGIN {IGNORECASE=1} NR>1 && $1 ~ "^"name' "$FILE")
        if [ -z "$result" ]; then
            echo "No Pokemon found."
        else
            echo "$header"
            echo "$result" | sort -t',' -k2 -r -n
        fi
    fi

# Filter
elif [ "$COMMAND" == "-f" ] || [ "$COMMAND" == "--filter" ]; then
    if [ -z "$OPTION" ]; then
        echo "Error: No filter option provided."; exit 1
    else
        header=$(awk 'NR==1' "$FILE")
        result=$(awk -F',' -v type="$OPTION" 'BEGIN {IGNORECASE=1} NR>1 && ($4 ~ "^"type || $5 ~ "^"type)' "$FILE")
        if [ -z "$result" ]; then
            echo "No Pokemon found with type starting with '$OPTION'."
        else
            echo "$header"
            echo "$result" | sort -t',' -k2 -r -n
        fi
    fi

# Help
elif [ "$COMMAND" == "-h" ] || [ "$COMMAND" == "--help" ]; then
    show_help
else
    echo "Error: Invalid command. Use -h or --help for instructions."
    exit 1
fi
