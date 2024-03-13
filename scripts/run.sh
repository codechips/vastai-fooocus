#!/usr/bin/env bash

function start_fooocus() {
	mkdir -p /workspace/logs
	cd /workspace/fooocus

	if [[ ${FOOOCUS_PRESET} ]]; then
		echo "fooocus: starting with preset ${FOOOCUS_PRESET}"
		nohup python entry_with_update.py --listen --port 3000 --preset ${FOOOCUS_PRESET} >/workspace/logs/fooocus.log 2>&1 &
	else
		echo "fooocus: starting"
		nohup python entry_with_update.py --listen --port 3000 >/workspace/logs/fooocus.log 2>&1 &
	fi

	echo "fooocus: started"
	echo "log file: /workspace/logs/fooocus.log"
}

function start_filebrowser() {
	echo "filebrowser: starting"
	cd /root

	if [[ ${LOGIN_PASSWORD} ]]; then
		echo "filebrowser: updated admin password"
		/usr/local/bin/filebrowser users update admin -p ${LOGIN_PASSWORD}
	fi

	nohup /usr/local/bin/filebrowser 2>&1 &
	echo "filebrowser: started"
}

start_filebrowser
start_fooocus

sleep infinity
