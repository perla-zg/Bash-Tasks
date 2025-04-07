#!/bin/bash

# Determine if the number is a multiple of 3 (Fizz),
# multiple of 5(Buzz) or both (FizzBuzz)

# script - start

for i in {1..100}
do
	VALUE=""	
        if [ $((i % 5)) -eq 0 ] && [ $((i % 3)) -eq 0 ]; then
                VALUE="FizzBuzz"	
	elif [ $((i % 5)) -eq 0 ]; then
               	VALUE="Fizz"
       	elif [ $((i % 3)) -eq 0 ]; then
       	       	VALUE="Buzz"
	else
		VALUE=$i
        fi
	echo "$VALUE"
done

# script - end
