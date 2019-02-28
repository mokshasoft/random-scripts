#!/bin/sh

cat $1 |
	awk -F ';' '{print $1}' |
	tr ' ' '\n' |
	grep "." |
	sort -n |
	uniq -c |
	sort -rn
