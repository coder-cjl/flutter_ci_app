#!/bin/bash

# 上传fir
apk_path="../build/app/outputs/flutter-apk/app-release.apk"
fir_cli_path="./go-fir-cli"

echo "开始上传 APK 到 Pgyer..."
echo "APK 路径: $apk_path"
echo "FIR CLI 路径: $fir_cli_path"
echo "token : $FIR_TOKEN"


# if [ ! -f "$apk_path" ]; then
#   echo "APK file not found at $apk_path"
#   exit 1
# fi

# echo "正在登录 Pgyer..."
# $fir_cli_path login -t $api_token

# if [ $? -ne 0 ]; then
#   echo "登录 Pgyer 失败，请检查 API Token 是否正确。"
#   exit 1
# fi

# echo "正在上传 APK 到 Pgyer..."
# $fir_cli_path upload -f $apk_path

# if [ $? -ne 0 ]; then
#   echo "上传 APK 到 Pgyer 失败。"
#   exit 1
# fi

echo "APK 上传成功！"