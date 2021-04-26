source ./env.sh

sleep 10

${SCRIPTS_DIR}/create-cr.sh
${SCRIPTS_DIR}/check-cr-ready.sh