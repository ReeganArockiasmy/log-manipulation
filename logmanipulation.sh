#!/bin/bash
LOGFILE=""
FROMDATE=""
TODATE=""
FROMTIME="00:00:00"
TOTIME="59:59:59"
USAGE="USAGE:\n
$0 -f <filename> \n
$0 -f <filename> -d 5,7\n
example:\n
$0 -f log.txt -d 9,9 -t 14:08:56,14:09:40"

filter_date(){
    FROMDATE=`echo $1 | cut -d "," -f 1`
    TODATE=`echo $1 | cut -d "," -f 2`
    echo $FROMDATE
    echo $TODATE
}

filter_time(){
    FROMTIME=`echo $1 | cut -d "," -f 1`
    TOTIME=`echo $1 | cut -d "," -f 2`
    echo $FROMTIME
    echo $TOTIME
}


#It is check command line argument as give or not
if [[ $# -eq 0 ]]
then
    echo -e $USAGE
    exit 1
fi

while [[ $# -gt 0 ]]
do
    
#Check options value and assign the variables
#echo $1
#It is check file and save file name in LOGFILE
    if [ "$1" = "-f" ]
    then
	shift
	LOGFILE=$1
	#It is check date and save date in date field
    elif [ "$1" = "-d" ]
    then
	shift
	filter_date $1

    elif [ "$1" = "-t" ]
    then
	shift
	filter_time $1
    fi
    shift
done

# Check log file give to input or not
if [[ -n $LOGFILE ]]
then
    echo "if conditon"
    awk -v start_day=$FROMDATE -v stop_day=$TODATE -v start_time=$FROMTIME -v stop_time=$TOTIME 'start_day <= $2 && $2 <= stop_day && (start_time <= $3 || start_day != $2) && $3 <= stop_time' $LOGFILE
else
    echo "must enter file name"
    echo $USAGE
fi


