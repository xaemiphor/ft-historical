#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
[ -z "${EXCHANGE:-}" ] && echo "ERROR: 'EXCHANGE' env var not defined" && exit 1
[ -z "${STAKE:-}" ] && echo "ERROR: 'STAKE' env var not defined" && exit 1
docker pull -q freqtradeorg/freqtrade:stable >/dev/null 2>&1
docker run \
	--rm \
	-v "${SCRIPT_DIR}/docker:/docker" \
	-v "${SCRIPT_DIR}/configs:/configs" \
	-v "${SCRIPT_DIR}/user_data:/freqtrade/user_data" \
	--entrypoint "/docker/entrypoint.sh" \
	freqtradeorg/freqtrade:stable "$@" \
	-c /configs/common.json -c /configs/exchange-${EXCHANGE}.json -c /configs/stake-${STAKE}.json
