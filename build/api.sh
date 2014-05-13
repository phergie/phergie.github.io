#!/bin/bash

if [ "$DIR" == "" ]; then
    DIR=$(dirname $0)
fi

if [ "$BASE_TARGET" == "" ]; then
    BASE_TARGET="$DIR/../api"
fi

if [ "$BOT_PATH" == "" ]; then
    BOT_PATH="$DIR/../../bot"
fi

if [ "$PHPDOC" == "" ]; then
    PHPDOC="php /home/`whoami`/bin/phpDocumentor.phar"
fi

if [ "$TEMPLATE" == "" ]; then
    TEMPLATE="--template=clean"
fi

$PHPDOC $TEMPLATE \
    -d $BOT_PATH/src,$BOT_PATH/vendor/phergie,$BOT_PATH/vendor/react,$BOT_PATH/vendor/evenement \
    --ignore "*/tests/*" \
    -t $BASE_TARGET/
