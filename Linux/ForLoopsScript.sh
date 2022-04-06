#!/bin/bash

states=('NewYork' 'California' 'Florida' 'Texas' 'Michigan')

for state in ${states[@]}
do 
	if [ $state = 'Florida' ]; then
	echo "$state is the best state"
	else
	echo "$state is not the best state"
	fi
done
