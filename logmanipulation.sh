LOGFILE=""
FROMDATE=""
TODATE=""
FROMTIME="00:00:00"
TOTIME="59:59:59"
USAGE="USAGE:\n
$0 -f <filename>"



#It is check command line argument as give or not
if [[ $# -eq 0 ]]
then
    echo -e $USAGE
    exit 1
fi

#Check options value and assign the variables
#echo $1
if [[ $1 -eq -f ]]
then
    echo $1
    shift
    LOGFILE=$1
else
    echo "tested"
fi

