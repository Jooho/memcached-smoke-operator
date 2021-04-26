source ./env.sh

# Clean All Objects
oc delete -f ${TEMPLATE_DIR}/pod.yaml
oc delete -f ${TEMPLATE_DIR}/pvc.yaml
oc delete -f ${TEMPLATE_DIR}/nfs.yaml

oc get subscription nfs-provisioner-operator
if [[ $? == 0 ]]; then oc delete -f ${TEMPLATE_DIR}/nfs-subs.yaml; fi

oc get operatorgroup nfsprovisioner-operator
if [[ $? == 0 ]]; then oc delete -f ${TEMPLATE_DIR}/nfs-og.yaml; fi

oc get catalogsource nfsprovisioner-catalog -n openshift-marketplace
if [[ $? == 0 ]]; then oc delete -f ${TEMPLATE_DIR}/nfs-cs.yaml; fi


