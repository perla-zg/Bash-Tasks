#!/bin/bash

CaesarCipher() {
        LETTERS=({a..z})
        LETTERS_LENGHT=${#LETTERS[@]}

        while read -r line; do
                
                ENCRYPTED_TEXT=""

                for (( i=0; i<${#line}; i++ )); do
                        CHAR="${line:i:1}"
                        
                        if [[ "$CHAR" =~ [a-z] ]]; then
                                
                                for INDEX in "${!LETTERS[@]}"; do

                                        if [[ ${LETTERS[$INDEX]} == "$CHAR" ]]; then
                                                NEW_INDEX=$(( (INDEX + SHIFT_ARG) % LETTERS_LENGHT ))
                                                
                                                if (( NEW_INDEX < 0 )); then
                                                        NEW_INDEX=$((NEW_INDEX + LETTERS_LENGHT))
                                                fi
                                                
                                                NEW_LETTER=${LETTERS[NEW_INDEX]}
                                                ENCRYPTED_TEXT+=$NEW_LETTER
                                                break
                                        fi
                                done
                        else
                                ENCRYPTED_TEXT+=$CHAR                       
                        fi
                done
                
                echo "$ENCRYPTED_TEXT" >> "$OUTPUT"
        
        done < "$FILE"
}

while getopts "i:o:s:" opt; do
    case $opt in
        s)
            SHIFT_ARG=$OPTARG
            ;;
        i)
            FILE=$OPTARG
            ;;
        o)
            OUTPUT=$OPTARG
            ;;
        *)
            echo "Invalid flag"
    esac
done

CaesarCipher

