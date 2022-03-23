GPUHOST="http://140.113.170.152:32777"

if [ $# -ne 2 ] ; then
	echo "Usage: $0 {userId :int} {sleepTime :int}"
	exit
fi

if [ $2 -lt 5 ] ; then
	echo "I think that's meanless."
	echo "set sleepTime at least 5 sec a round"
	exit
fi

echo "MI/VF/AF/HF result will be"
echo "4 /3 /2 /1"
echo "1 /4 /3 /2"
echo "2 /1 /4 /3"
echo "3 /2 /1 /4"
#1: 0 0 0
#2: 1 0 0
#3: 1 1 0
#4: 1 1 1
echo "============= STATE & REF =============="
TERM=1
while [ 1 -eq 1 ] ; do
	if [ $TERM -eq 1 ] ; then
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_ON/0/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_detect/0
		
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_ON/1/1
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_detect/1
		
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_detect/1
		
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_detect/0

		let "TERM+=1"
	elif [ $TERM -eq 2 ] ; then
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_detect/0
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_ON/0/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_detect/0
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_ON/1/1
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_detect/1
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_detect/1

		let "TERM+=1"
	elif [ $TERM -eq 3 ] ; then
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_detect/1
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_detect/0
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_ON/0/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_detect/0
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_ON/1/1
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_detect/1

		let "TERM+=1"
	elif [ $TERM -eq 4 ] ; then 
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_ON/1/1
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/MI_detect/1
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/VF_detect/1
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_ON/1/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/AF_detect/0
		                                
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_ON/0/0
		curl --silent --output /dev/null -X GET $GPUHOST/users/model/"$1"/HF_detect/0

		let "TERM=1"
	fi

	sh showAIResult.sh $1 
	sleep $2
done



