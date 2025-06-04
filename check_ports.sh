#!/bin/bash

# 检查端口是否被占用
check_and_free_port() {
    local port=$1
    echo "Checking if port $port is in use..."

    # 使用 lsof 检查端口是否被占用
    if lsof -i :$port > /dev/null; then
        echo "Port $port is in use. Attempting to free it..."

        # 获取占用该端口的进程PID并杀掉它
        pid=$(lsof -t -i :$port)
        if [ -n "$pid" ]; then
            echo "Killing process with PID $pid occupying port $port"
            kill -9 $pid
            echo "Port $port is now free."
        else
            echo "No process found using port $port."
        fi
    else
        echo "Port $port is available."
    fi
}

# 检查并释放 5212 和 6800 端口
check_and_free_port 5212
check_and_free_port 6800
