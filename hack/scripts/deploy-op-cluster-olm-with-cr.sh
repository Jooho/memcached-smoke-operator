source ./env.sh


# Clean up
oc delete -f ${TEMPLATE_DIR}/nfs.yaml
sleep 5

# NFS Operator Namespace
oc project ${NAMESPACE}
if [[ $? != 0 ]] 
then
  oc new-project ${NAMESPACE}
fi

# Setup OLM stuff
oc get catalogsource nfsprovisioner-catalogsource -n openshift-marketplace
if [[ $? != 0 ]]; then oc create -f ${TEMPLATE_DIR}/nfs-cs.yaml; fi

oc get operatorgroup nfsprovisioner-operator -n ${NAMESPACE}
if [[ $? != 0 ]]; then oc create -f ${TEMPLATE_DIR}/nfs-og.yaml; fi

oc get subscription nfs-provisioner-operator -n ${NAMESPACE}
if [[ $? != 0 ]]; then oc create -f ${TEMPLATE_DIR}/nfs-subs.yaml; fi

# Deploy NFS
oc create -f ${TEMPLATE_DIR}/nfs.yaml
sleep 5


${SCRIPTS_DIR}/check-nfs-ready.sh