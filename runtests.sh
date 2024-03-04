#! /bin/bash

TESTFILE=${1:-testdata.txt}

sed -e $'/^[ \t]*#/d' -e $'/^[ \t]*$/d' $TESTFILE |
	while IFS=$'\t' read options expr chars
	do
		./btest $options "$expr" "$chars"
		echo
	done
