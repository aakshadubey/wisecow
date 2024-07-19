#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
    read line
    echo $line
}

handleRequest() {
    # 1) Process the request
    get_api
    mod=$(fortune | cowsay)
    cat <<EOF > $RSPFILE
HTTP/1.1 200 OK
Content-Length: ${#mod}

$mod
EOF
}

# Start the server
while true; do
    nc -l -p $SRVPORT < $RSPFILE | handleRequest
done

