#!/bin/bash

# This script will help you perform the following operations: + , - , * , %
# <----- IMPORTANT ----->
# The numbers in n option must be encased in quotes
# To multiply, you must put the * in quotes


# script ------ start

FILTERED_NUMBERS=()

while getopts "o:n:d" opt; do
        case $opt in

                o)
                        OPERATION=$OPTARG
                        ;;
                n)
                        ARGS=($@)
                        IFS=" "
                        for ARG in "${ARGS[@]}"; do
                                if [[ $ARG =~ ^[0-9]+$ ]]; then
                                     FILTERED_NUMBERS+=("$ARG$IFS")
                                fi
                        done
                        IFS=' ' read -r -a NUMBERS_ARRAY <<< "${FILTERED_NUMBERS[@]}"

                        case $OPERATION in
                                +)
                                        SUM=0
                                        for NUMBER in "${NUMBERS_ARRAY[@]}"; do
                                                SUM=$(( SUM + NUMBER ))
                                        done
                                        echo "Total: $SUM"
                                        ;;
                                -)
                                        DIFF=${NUMBERS_ARRAY[0]}
                                        for ((i=1; i<"${#NUMBERS_ARRAY[@]}"; i++)); do
                                                DIFF=$(( DIFF - NUMBERS_ARRAY[i] ))
                                        done
                                        echo "Total: $DIFF"
                                        ;;
                                \*)
                                        PROD=1
                                        for NUMBER in "${NUMBERS_ARRAY[@]}"; do
                                                PROD=$(( PROD * NUMBER ))
                                        done
                                        echo "Total: $PROD"
                                        ;;
                                %)
                                        QUOT=${FILTERED_NUMBERS[0]}
                                        for NUMBER in "${FILTERED_NUMBERS[@]}"; do
                                                QUOT=$(( QUOT % NUMBER ))
                                        done
                                        echo "Total: $QUOT"
                                        ;;
                        esac
                        ;;
                d)
                        echo "User running the script: $(whoami)"
                        echo "Script name: $(basename "$0")"
                        echo "Operation: $OPERATION"
                        echo "Numbers: ${FILTERED_NUMBERS[*]}"
                        ;;
                *)
                        echo "Invalid Option"
                        ;;
        esac
done

# script -------- end 
