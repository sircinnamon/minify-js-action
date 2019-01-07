#!/bin/sh
OUTPUT_FILENAME="main.js"
while getopts :o: opt; do
	case $opt in
		o)
			OUTPUT_FILENAME=$OPTARG
		;;
		\?)
		  echo "Invalid option: -$OPTARG" >&2
		  exit 1
		;;
		:)
		  echo "Option -$OPTARG requires an argument." >&2
		  exit 1
		;;
	esac
done

# echo $OUTPUT_FILENAME
if [ -f $OUTPUT_FILENAME ]; then
	rm $OUTPUT_FILENAME
fi

i=0
len=$#
while [ $i -lt $len ]
do
    if [ "$1" = "-o" ]; then
    	shift
    	let i=i+1
    elif [ -f $1 ]; then
    	if [ -f $OUTPUT_FILENAME ]; then
    		cat $1 >> $OUTPUT_FILENAME
    	else
    		cp -p $1 $OUTPUT_FILENAME
    	fi
    fi
    shift
    let i=i+1
done


uglifyjs $OUTPUT_FILENAME -o $OUTPUT_FILENAME

# cat $OUTPUT_FILENAME
