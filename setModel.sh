GPUHOST="http://140.113.170.152:32777"

if [ $# -ne 3 ] ; then
	echo "Usage: $0 {userId} {setState&setRef :(y/n)} {setDetect :(y/n)}"
	exit
fi

echo ""
echo "Testing: $GPUHOST/users/model/{userId}/{model_ON}/{state}/{ref}"
echo "Testing: $GPUHOST/users/model/{userId}/{model_detect}/{state}"
echo "============= STATE & REF =============="
if [ $2 == "y" ] ; then
	read -p "MI status & ref:(1/0) (1/0) " MI_STATE MI_REF
	read -p "VF status & ref:(1/0) (1/0) " VF_STATE VF_REF
	read -p "AF status & ref:(1/0) (1/0) " AF_STATE AF_REF
	read -p "HF status & ref:(1/0) (1/0) " HF_STATE HF_REF
	
	echo ""
	if [ $MI_STATE -eq 1 -o $MI_STATE -eq 0 ] ; then	
		if [ $MI_REF -eq 1 -o $MI_REF -eq 0 ] ; then
			curl -X GET $GPUHOST/users/model/"$1"/MI_ON/"$MI_STATE"/"$MI_REF"
			echo ""
		else	
			curl -X GET $GPUHOST/users/model/"$1"/MI_ON/"$MI_STATE"
			echo ""
		fi
	fi

	if [ $VF_STATE -eq 1 -o $VF_STATE -eq 0 ] ; then	
		if [ $VF_REF -eq 1 -o $VF_REF -eq 0 ] ; then
			curl -X GET $GPUHOST/users/model/"$1"/VF_ON/"$VF_STATE"/"$VF_REF"
			echo ""
		else	
			curl -X GET $GPUHOST/users/model/"$1"/VF_ON/"$VF_STATE"
			echo ""
		fi
	fi
	
	if [ $AF_STATE -eq 1 -o $AF_STATE -eq 0 ] ; then	
		if [ $AF_REF -eq 1 -o $AF_REF -eq 0 ] ; then
			curl -X GET $GPUHOST/users/model/"$1"/AF_ON/"$AF_STATE"/"$AF_REF"
			echo ""
		else	
			curl -X GET $GPUHOST/users/model/"$1"/AF_ON/"$AF_STATE"
			echo ""
		fi
	fi

	if [ $HF_STATE -eq 1 -o $HF_STATE -eq 0 ] ; then	
		if [ $HF_REF -eq 1 -o $HF_REF -eq 0 ] ; then
			curl -X GET $GPUHOST/users/model/"$1"/HF_ON/"$HF_STATE"/"$HF_REF"
			echo ""
		else	
			curl -X GET $GPUHOST/users/model/"$1"/HF_ON/"$HF_STATE"
			echo ""
		fi
	fi
fi
echo ""
echo "============= DETECT =============="
if [ $3 == "y" ] ; then
	read -p "MI_detect: (1/0) " MI_DETECT
	read -p "VF_detect: (1/0) " VF_DETECT
	read -p "AF_detect: (1/0) " AF_DETECT
	read -p "HF_detect: (1/0) " HF_DETECT
	echo ""

	if [ $MI_DETECT -eq 1 -o $MI_DETECT -eq 0 ] ; then
		curl -X GET $GPUHOST/users/model/"$1"/MI_detect/"$MI_DETECT"
		echo ""
	fi

	if [ $VF_DETECT -eq 1 -o $VF_DETECT -eq 0 ] ; then
		curl -X GET $GPUHOST/users/model/"$1"/VF_detect/"$VF_DETECT"
		echo ""
	fi

	if [ $AF_DETECT -eq 1 -o $AF_DETECT -eq 0 ] ; then
		curl -X GET $GPUHOST/users/model/"$1"/AF_detect/"$AF_DETECT"
		echo ""
	fi
	
	if [ $HF_DETECT -eq 1 -o $HF_DETECT -eq 0 ] ; then
		curl -X GET $GPUHOST/users/model/"$1"/HF_detect/"$HF_DETECT"
		echo ""
	fi
fi
echo ""

sh showAIResult.sh $1 
