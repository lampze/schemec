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


scc(){
    INNAME=$(procNAME $1)
    OUTNAME=$(echo $1 | cut -d . -f 1).boot
    OUTNAME=$(procNAME $OUTNAME)
if [ $# -lt 2 ]; then
    echo "(make-boot-file ${OUTNAME} '(\"scheme\" \"petite\") ${INNAME})" | scheme -q
else
    DEPENDNAME=$(echo $* | cut -d ' ' -f 2-$#)
    DEPENDNAME=$(procNAME $DEPENDNAME)
    echo "(make-boot-file ${OUTNAME} '(\"scheme\" \"petite\") ${DEPENDNAME} ${INNAME})" | scheme -q
fi
}


if [ $# = 0 ]; then
    echo "这是一个将chez scheme语言编译成boot文件的脚本，请在命令后面接上要编译的文件。"
else
    scc $*
fi
