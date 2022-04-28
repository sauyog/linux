#!/bin/bash
for ((counter=0;counter<=70;counter++))
do
        printf "cpuid -l 0X4ffffffd -s $counter"
        cpuid -l 0X4ffffffd -s $counter
done