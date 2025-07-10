#!/bin/bash

# 配置变量
SCRIPT_PATH="/a.sh"      # 要监控的脚本路径
CHECK_INTERVAL=5         # 检查间隔（秒）
#LOG_FILE="gen_monitor.log"  # 日志文件路径

# 创建日志目录（如果不存在）
#mkdir -p "$(dirname "$LOG_FILE")"
#touch "$LOG_FILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') - $SCRIPT_PATH 开始运行" 
# >> "$LOG_FILE"

# 无限循环监控
while true; do
    # 检查脚本是否运行
    if pgrep -f "$SCRIPT_PATH" >/dev/null; then
        #echo "$(date '+%Y-%m-%d %H:%M:%S') - $SCRIPT_PATH 正在运行" >> "$LOG_FILE"
        :
    else
        echo "Starting $SCRIPT_PATH..."
        # echo "$(date '+%Y-%m-%d %H:%M:%S') - $SCRIPT_PATH 未运行，正在启动..." >> "$LOG_FILE"
        # nohup ".$SCRIPT_PATH" >> "$LOG_FILE" 2>&1 &  # 后台启动并记录日志
        # sleep 1  # 避免频繁启动检查
        ".$SCRIPT_PATH" 2>&1 || echo "gen脚本出错, 守护脚本继续运行..."
    fi
    
    # 等待下一次检查
    sleep "$CHECK_INTERVAL"
done
