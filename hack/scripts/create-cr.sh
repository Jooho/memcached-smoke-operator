source ./env.sh

# Operator Namespace
oc project ${NAMESPACE}
if [[ $? != 0 ]] 
then
  oc new-project ${NAMESPACE}
fi

# Clean (If test CR exist, clean it up first)
oc delete -f ${TEMPLATE_DIR}/cr.yaml

# Deploy CR
oc create -f ${TEMPLATE_DIR}/cr.yaml
sleep 5

