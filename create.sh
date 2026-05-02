#!/bin/bash

# Get absolute path of the framework root
XCODER_ROOT=$(cd "$(dirname "$0")"; pwd)
TARGET_PATH=$1
BUNDLE_PREFIX=${2:-"com.xcoder"} # Default to com.xcoder if not provided

if [ -z "$TARGET_PATH" ]; then
    echo "Usage: ./create.sh <target_directory> [bundle_id_prefix]"
    echo "Example: ./create.sh ../MyNewApp com.sunguannan"
    exit 1
fi

APP_NAME=$(basename "$TARGET_PATH")
echo "🚀 Xcoder-For-Agents: Initializing project '$APP_NAME' with prefix '$BUNDLE_PREFIX'..."

# 1. Environment Check: Prevent sudo block during automation
XCODE_PATH=$(xcode-select -p)
if [[ $XCODE_PATH == *"CommandLineTools"* ]]; then
    echo "❌ ERROR: System is using CommandLineTools which blocks automation."
    echo "ACTION REQUIRED: Run this manually once: sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
    exit 1
fi

# 2. Create target directory structure
mkdir -p "$TARGET_PATH/Sources/$APP_NAME"
mkdir -p "$TARGET_PATH/fastlane"

# 3. Copy templates and assets
cp -R "$XCODER_ROOT/Resources" "$TARGET_PATH/" 
cp "$XCODER_ROOT/project.yml" "$TARGET_PATH/"
cp "$XCODER_ROOT/.xcoder-instructions.md" "$TARGET_PATH/"
cp "$XCODER_ROOT/fastlane/Fastfile" "$TARGET_PATH/fastlane/"
cp "$XCODER_ROOT/.gitignore" "$TARGET_PATH/"

# 4. Variable replacement
# Replace App Name placeholders
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/project.yml"
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/fastlane/Fastfile"
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/Resources/Info.plist"
# Replace Bundle ID Prefix
sed -i '' "s/com.xcoder/$BUNDLE_PREFIX/g" "$TARGET_PATH/project.yml"

echo "✅ Project '$APP_NAME' initialized."
echo "📍 Your Bundle ID will be: $BUNDLE_PREFIX.$APP_NAME"
