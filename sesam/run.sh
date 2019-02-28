#!/bin/sh

file=sesam-2019.txt

# make a copy
cp $file tmp

. dist.sh tmp |
	awk '{print "grep \" " $2 " \" tmp ; grep -v \" " $2 " \" tmp > tmp2 ; mv tmp2 tmp ; echo \"\""}' |
	sh |
	uniq
