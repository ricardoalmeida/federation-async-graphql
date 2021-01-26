#!/bin/bash

function cleanup {
    kill "$ACCOUNTS_PID"
}
trap cleanup EXIT

cargo build --bin federation-accounts

cargo run --bin federation-accounts &
ACCOUNTS_PID=$!

sleep 3

node index.js