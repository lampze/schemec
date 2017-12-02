#! /bin/bash

procNAME(){
    c=0
    for i in $*;
    do
        N[$c]=\"${i}\"
        ((c++))
    done
    echo ${N[@]}
}
INNAME=\"${1}\"
OUTNAME=\"$(echo $1 | cut -d . -f 1).boot\"
DEPENDNAME=$(echo $* | cut -d ' ' -f 2-$#)
DEPENDNAME=$(procNAME $DEPENDNAME)

echo "(make-boot-file ${OUTNAME} '(\"scheme\" \"petite\") ${DEPENDNAME} ${INNAME})" | scheme -q
