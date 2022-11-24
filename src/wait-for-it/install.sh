#!/usr/bin/env bash

set -e
set -u

if command -v apt-get >/dev/null 2>&1; then
    apt-get update
    apt-get install -y git
elif command -v yum >/dev/null 2>&1; then
    yum install -y git
else
    echo "Cannot find supported package manager"
    exit 1
fi

TMP_DIR=/tmp/wait

mkdir --parents $TMP_DIR
pushd $TMP_DIR

git clone --depth 1 https://github.com/vishnubob/wait-for-it.git
cp wait-for-it/wait-for-it.sh /usr/local/bin/

popd
rm -rf $TMP_DIR

# setup args
WAIT_FOR_IT_ARGS="--host=$HOST --port=$PORT --timeout=$TIMEOUT"
if [ "$STRICT" = "true" ]; then
    WAIT_FOR_IT_ARGS="$WAIT_FOR_IT_ARGS --strict"
fi
if [  "$QUIET" = "true" ]; then
    WAIT_FOR_IT_ARGS="$WAIT_FOR_IT_ARGS --quiet"
fi

# create an entrypoint executable
cat << EOF >> /usr/local/share/wait-for-it-entrypoint.sh
#!/usr/bin/env bash

wait-for-it.sh $WAIT_FOR_IT_ARGS

exec "\$@"
EOF

chmod +x /usr/local/share/wait-for-it-entrypoint.sh
