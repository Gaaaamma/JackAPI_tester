if [ $# -eq 0 ] ; then
	echo "Usage: $0 {userId}"
	exit
fi


echo "============= RESULT =============="
curl -X GET http://140.113.170.152:8080/users/"$1" -H "Accept: application/json" | jq . > userAIModel.json

printf "MI_ON: "
jq .MI_ON userAIModel.json
printf "MI_ON_ref: "
jq .MI_ON_ref userAIModel.json

printf "VF_ON: "
jq .VF_ON userAIModel.json
printf "VF_ON_ref: "
jq .VF_ON_ref userAIModel.json

printf "AF_ON: "
jq .AF_ON userAIModel.json
printf "AF_ON_ref: "
jq .AF_ON_ref userAIModel.json

printf "HF_ON: "
jq .HF_ON userAIModel.json
printf "HF_ON_ref: "
jq .HF_ON_ref userAIModel.json

echo ""
printf "MI_detect: "
jq .MI_detect userAIModel.json

printf "VF_detect: "
jq .VF_detect userAIModel.json

printf "AF_detect: "
jq .AF_detect userAIModel.json

printf "HF_detect: "
jq .HF_detect userAIModel.json
echo ""
