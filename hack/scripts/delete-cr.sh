source ./env.sh

# Operator Namespace
oc project ${NAMESPACE}
if [[ $? != 0 ]] 
then
  echo "${NAMESPACE} does not exist"
  exit 1
fi

# Clean
oc delete -f ${TEMPLATE_DIR}/cr.yaml
sleep 5

