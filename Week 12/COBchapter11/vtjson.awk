# Cybersecurity Ops with bash # vtjson.awk
#
# Description:
# Search a JSON file for VirusTotal malware hits #
# Usage:
# vtjson.awk <json file>
#   <json file> File containing results from VirusTotal
#
FN="${1:-Calc_VirusTotal.txt}"
sed -e 's/{"scans": {/&\n /' -e 's/},/&\n/g' "$FN" | awk '
NF == 9 {
COMMA=","
QUOTE="\""
if ( $3 == "true" COMMA ) {
VIRUS=$1
gsub(QUOTE, "", VIRUS)
RESLT=$7
gsub(QUOTE, "", RESLT) gsub(COMMA, "", RESLT)
print VIRUS, "- result:", RESLT }
      }'
