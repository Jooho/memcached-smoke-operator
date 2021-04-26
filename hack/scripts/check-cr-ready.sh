
checkcount=10
tempcount=0

while true; do
  ready=$(oc get deploy ${TARGET_DEPLOY_NAME} --no-headers|awk '{print $2}'|cut -d/ -f1)
  desired=$(oc get deploy ${TARGET_DEPLOY_NAME} --no-headers|awk '{print $2}'|cut -d/ -f2)

  if [[ $ready == $desired ]]
  then
    echo "CR is Ready!"
    break
  else 
    tempcount=$((tempcount+1))
    echo "CR is not Ready: $tempcount times"
    echo "Wait for 10 secs"

    sleep 10
  fi
  if [[ $ready != $desired ]] && [[ $checkcount == $tempcount ]]
  then
    echo "1"
    exit 1
    break
  fi
done