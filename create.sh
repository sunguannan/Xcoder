#!/bin/bash

# 获取 Xcoder 绝对路径
XCODER_ROOT=$(cd "$(dirname "$0")"; pwd)
TARGET_PATH=$1

if [ -z "$TARGET_PATH" ]; then
    echo "Usage: ./create.sh <target_directory>"
    exit 1
fi

APP_NAME=$(basename "$TARGET_PATH")
echo "🚀 Xcoder: Initializing project '$APP_NAME'..."

# 1. 权限自修复：确保脚本本身可执行
chmod +x "$XCODER_ROOT/create.sh"

# 2. 环境强检：解决 sudo 阻塞坑 (Pit 4)
# Agent 曾因 xcode-select 指向 CLT 且无 sudo 密码而失败
XCODE_PATH=$(xcode-select -p)
if [[ $XCODE_PATH == *"CommandLineTools"* ]]; then
    echo "❌ ERROR: xcode-select points to CommandLineTools, which blocks automation."
    echo "Please run this ONCE now to fix it: sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
    exit 1
fi

# 3. 创建目录结构
mkdir -p "$TARGET_PATH/Sources/$APP_NAME"
mkdir -p "$TARGET_PATH/fastlane"

# 4. 拷贝模板与资源：解决资源缺失坑 (Pit 6 & 9)
# 自动拷贝预置的图标和 Info.plist
cp -R "$XCODER_ROOT/Resources" "$TARGET_PATH/" 
cp "$XCODER_ROOT/project.yml" "$TARGET_PATH/"
cp "$XCODER_ROOT/.xcoder-instructions.md" "$TARGET_PATH/"
cp "$XCODER_ROOT/fastlane/Fastfile" "$TARGET_PATH/fastlane/"
cp "$XCODER_ROOT/.gitignore" "$TARGET_PATH/"

# 5. 变量替换
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/project.yml"
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/fastlane/Fastfile"
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/Resources/Info.plist"

echo "✅ Project '$APP_NAME' initialized. Assets copied."
