#!/bin/bash

# 上传fir
apk_path="$1"
fir_cli_path="./pgyer_upload.sh"
api_token=$FIR_TOKEN

set -x
ls -la

if [ -z "$api_token" ]; then
  echo "请设置 FIR_TOKEN 环境变量。"
  exit 1
fi

echo "开始上传 APK 到 Pgyer..."
$fir_cli_path -k $api_token $apk_path

if [ $? -ne 0 ]; then
  echo "上传 APK 到 Pgyer 失败。"
  exit 1
fi

echo "APK 上传成功！"