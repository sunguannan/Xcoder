#!/bin/bash

# Get absolute path of the framework root
XCODER_ROOT=$(cd "$(dirname "$0")"; pwd)
TARGET_PATH=$1

if [ -z "$TARGET_PATH" ]; then
    echo "Usage: ./create.sh <target_directory>"
    exit 1
fi

APP_NAME=$(basename "$TARGET_PATH")
echo "🚀 Xcoder-For-Agents: Initializing project '$APP_NAME'..."

# 1. Environment Check: Prevent sudo block during automation
# Check if xcode-select points to full Xcode.app instead of CommandLineTools
XCODE_PATH=$(xcode-select -p)
if [[ $XCODE_PATH == *"CommandLineTools"* ]]; then
    echo "❌ ERROR: System is using CommandLineTools which blocks automation (agvtool requires Xcode)."
    echo "ACTION REQUIRED: Run this manually once: sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
    exit 1
fi

# 2. Self-repair permissions
chmod +x "$XCODER_ROOT/create.sh"

# 3. Create target directory structure
mkdir -p "$TARGET_PATH/Sources/$APP_NAME"
mkdir -p "$TARGET_PATH/fastlane"

# 4. Copy templates and assets: Fixes missing AppIcon and Info.plist issues
cp -R "$XCODER_ROOT/Resources" "$TARGET_PATH/" 
cp "$XCODER_ROOT/project.yml" "$TARGET_PATH/"
cp "$XCODER_ROOT/.xcoder-instructions.md" "$TARGET_PATH/"
cp "$XCODER_ROOT/fastlane/Fastfile" "$TARGET_PATH/fastlane/"
cp "$XCODER_ROOT/.gitignore" "$TARGET_PATH/"

# 5. Variable replacement: Rename placeholders to project name
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/project.yml"
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/fastlane/Fastfile"
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/Resources/Info.plist"

echo "✅ Project '$APP_NAME' initialized successfully with preset assets."
