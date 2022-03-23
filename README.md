# JackAPI_tester
Used to test JackAPI<br>

## Dependencies
curl, jq<br> 

## showAIResult.sh
Used to show AI Result.<br>
Usage: ./showAIResult.sh {userId}<br>

## setModel.sh
Used to set AI Model ON/OFF<br>
Note: Will show AI Result at the End -> Means u need to have showAIResult.sh in the same path<br>
Usage: ./setModel.sh {userId} {modelSetting (y/n)} {detectSetting (y/n)}<br>

## setModelLoop.sh
Used to set AI Model in a pattern every {sleepTime} second.<br>
Note: Will show AI Result at the End -> Means u need to have showAIResult.sh in the same path<br>
Usage: ./setModelLoop.sh {userId} {sleepTime :int}<br>
