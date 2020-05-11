#!/bin/bash -
#
# Rapid Cybersecurity Ops
# vtjson.sh
#
# Description:
# Search a JSON file for VirusTotal malware hits #
# Usage:
# # # #
vtjson.awk [<json file>]
<json file> File containing results from VirusTotal
default: Calc_VirusTotal.txt
 RE='^.(.*)...\{.*detect..(.*),..vers.*result....(.*).,..update.*$' FN="${1:-Calc_VirusTotal.txt}"
 sed -e 's/{"scans": {/&\n /' -e 's/},/&\n/g' "$FN" | while read ALINE
do
if [[ $ALINE =~ $RE ]] then
  VIRUS="${BASH_REMATCH[1]}" FOUND="${BASH_REMATCH[2]}" RESLT="${BASH_REMATCH[3]}"
if [[ $FOUND =~ .*true.* ]] then
echo $VIRUS "- result:" $RESLT fi
 fi 
done
