#!/bin/bash

# 上传fir
api_token = "a7d3b217e7132bd0b79ffa45f35651b3"
apk_path = "../../build/app/outputs/apk/release/app-release.apk"

sh "./go-fir-cli login -t #{api_token}"
sh "./go-fir-cli upload -f #{apk_path}"