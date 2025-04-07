#!/bin/bash

while getopts "i:o:s:ulvr" opt; do
	case $opt in
	
		i)
			INFILE="$OPTARG"
			;;
		o)
			OUTFILE="$OPTARG"
			;;
		u)
			while IFS= read -r line; do
				echo "$line" | tr '[:lower:]' '[:upper:]' > "$OUTFILE"
                	done <"$INFILE"
			;;
		l)
			while IFS= read -r line; do
                                echo "$line" | tr '[:upper:]' '[:lower:]' > "$OUTFILE"
                        done <"$INFILE"
                        ;;
		v)
			while IFS= read -r line; do
				for (( i = 0 ; i < ${#line}; i++ )); do
					CHAR="${line:$i:1}"
					if [[ $CHAR =~ [a-z] ]]; then
						NEWLINE+=$(echo "$CHAR" | tr '[:lower:]' '[:upper:]')
					elif [[ $CHAR =~ [A-Z] ]]; then	 
						NEWLINE+=$(echo "$CHAR" | tr '[:upper:]' '[:lower:]')
					else
						NEWLINE+="$CHAR"
					fi
	                               
				done
				echo "$NEWLINE" >> "$OUTFILE"
			done <"$INFILE"
			;;    		
		s)
			ARGS=$@
			A_WORD=$(echo "$ARGS" | awk -F "-s" '{print $2}' | awk -F " " '{print $1}')

			B_WORD=$(echo "$ARGS" | awk -F "-s" '{print $2}' | awk -F " " '{print $2}')	
			FILE=$(< "$INFILE")

			echo "${FILE//$A_WORD/$B_WORD}" > "$OUTFILE"				
			;;
		r)
			while IFS= read -r line; do
				REVERSE=""
				for (( i = ${#line} - 1; i >= 0; i-- )); do
					CHAR="${line:$i:1}"
					REVERSE+=$CHAR
				done
				echo "$REVERSE" >> "$OUTFILE"
			done <"$INFILE"
			;;			
	esac
done
