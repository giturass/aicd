#!/bin/bash

aria2c --enable-rpc --rpc-secret 4aria@Moe^2025! --rpc-listen-all & 

./aicd -c /app/conf.ini
