#!/bin/bash 

DEEPORNOT="-maxdepth 1"        
# PARSE option arguments:
while getopts 'c:irR' opt; do                         # <1>
  case "${opt}" in                                    # <2>
    c) # copy found files to specified directory
           COPY=YES
           DESTDIR="$OPTARG"                             # <3>
           ;;
    i) # ignore u/l case differences in search
           CASEMATCH='-i'
           ;;
    [Rr]) # recursive                                 # <4>
        unset DEEPORNOT;;                             # <5>
    *)  # unknown/unsupported option                  # <6>
        # error mesg will come from getopts, so just exit
        exit 2 ;;
  esac
done
shift $((OPTIND - 1))                                 # <7>


PATTERN=${1:-PDF document}                            # <8>
STARTDIR=${2:-.}    # by default start here

find $STARTDIR $DEEPORNOT -type f | while read FN     # <9>
do
    file $FN | egrep -q $CASEMATCH "$PATTERN"          # <10>
    if (( $? == 0 ))   # found one                    # <11>
    then
            echo $FN
            if [[ $COPY ]]                               # <12>
            then
                cp -p $FN $DESTDIR                       # <13>
            fi
    fi
done

