HASH=$1
DIR=${2:-.}    # default is here, cwd

# convert pathname into an absolute path
function mkabspath ()                # <6>
{
    if [[ $1 == /* ]]                # <7>
    then
        ABS=$1
    else
        ABS="$PWD/$1"                # <8>
    fi
}

find $DIR -type f |                # <1>
while read fn
do
    THISONE=$(sha1sum "$fn")            # <2>
    THISONE=${THISONE%% *}            # <3>
    if [[ $THISONE == $HASH ]]
    then
    mkabspath "$fn"                # <4>
    echo $ABS                # <5>
    fi
done

