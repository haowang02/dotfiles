#!/bin/bash

OLLAMA_EXIT_CODE=
while [[ $OLLAMA_EXIT_CODE != 0 ]]
do
    ollama pull "$@"
    OLLAMA_EXIT_CODE=$?
done
