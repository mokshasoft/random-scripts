#/bin/sh

#
# Transforms a SIE-4 import file to an hledger journal file
#

dos2unix |
  iconv -f latin1 -t UTF-8 |
  grep -E "^#VER|^#TRANS" |
  tr -d "{}" |
  awk -F ' ' '{if ($1 == "#VER") {$1=$2=$3=$NF=""; gsub(/^[ \t]+/,"",$0); print $0} else {print $0}}' |
  awk '{if ($1 == "#TRANS") {print "  " $2 " " $3} else {print $0}}'
