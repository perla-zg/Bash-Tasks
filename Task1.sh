#!/bin/bash

funcFib() {
        N=$1
        F0=0
        F1=1
	
        for (( i=0; i<N; i++ )); do
		
		echo "$F0"
		FN=$(( F0 + F1 ))
                F0=$F1
                F1=$FN
        done
}

read -p "Enter the fibonacci index:" N
result=$(funcFib "$N")
echo "$result"
