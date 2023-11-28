#!/bin/sh

while true; do
    corrid=$(uuidgen)
    echo "{\"x-correlation-id\": \"${corrid}\", \"level\": \"info\", \"msg\": \"Goodbye cruel world\"}"
    sleep 1
    echo "{\"x-correlation-id\": \"${corrid}\", \"level\": \"info\", \"msg\": \"I'm leaving you today\"}"
    sleep 1
    echo "{\"x-correlation-id\": \"${corrid}\", \"level\": \"info\", \"msg\": \"Goobye\"}"
    sleep 1
    echo "{\"x-correlation-id\": \"${corrid}\", \"level\": \"error\", \"msg\": \"Goodbye!\"}"
    sleep 1
    echo "{\"x-correlation-id\": \"${corrid}\", \"level\": \"fatal\", \"msg\": \"Goodbye!!\"}"
    sleep 5
done
