#!/bin/bash

# 1. 檢查是否剛好有兩個輸入參數
if [ $# -ne 2 ]; then
    echo "Error: Invalid number of arguments."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

# 2. 取得檔案所在的資料夾路徑，並建立它 (-p 會連同不存在的父資料夾一起建立)
DIRPATH=$(dirname "$WRITEFILE")
mkdir -p "$DIRPATH"

# 3. 建立檔案並寫入字串 (如果檔案已存在會直接覆蓋)
echo "$WRITESTR" > "$WRITEFILE"

# 4. 檢查檔案是否成功建立 (判斷上一個指令的執行結果)
if [ $? -ne 0 ]; then
    echo "Error: Failed to create file $WRITEFILE"
    exit 1
fi