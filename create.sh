#!/bin/bash

# Get the absolute path of Xcoder directory to locate templates
XCODER_ROOT=$(cd "$(dirname "$0")"; pwd)
TARGET_PATH=$1

if [ -z "$TARGET_PATH" ]; then
    echo "Usage: ./create.sh <target_directory>"
    echo "Example: ./create.sh ../MyNewApp"
    exit 1
fi

APP_NAME=$(basename "$TARGET_PATH")

echo "🚀 Xcoder: Initializing new project '$APP_NAME' in $TARGET_PATH..."

# 1. Global Tool Check
command -v brew >/dev/null 2>&1 || { echo "Installing Homebrew..."; /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }
echo "📦 Ensuring XcodeGen, Fastlane, and ios-deploy are installed..."
brew install xcodegen fastlane ios-deploy

# 2. Create Target Structure
mkdir -p "$TARGET_PATH/Sources/$APP_NAME"
mkdir -p "$TARGET_PATH/Resources"
mkdir -p "$TARGET_PATH/fastlane"

XCODE_PATH=$(xcode-select -p)
if [[ $XCODE_PATH == *"CommandLineTools"* ]]; then
    echo "⚠️  WARNING: xcode-select points to CommandLineTools."
    echo "Please run: sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
fi

# 3. Copy Template Files from Xcoder to Target
cp "$XCODER_ROOT/project.yml" "$TARGET_PATH/"
cp "$XCODER_ROOT/.xcoder-instructions.md" "$TARGET_DIR/"
cp "$XCODER_ROOT/fastlane/Fastfile" "$TARGET_PATH/fastlane/"
cp "$XCODER_ROOT/.gitignore" "$TARGET_PATH/"

sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/project.yml"
sed -i '' "s/XcoderApp/$APP_NAME/g" "$TARGET_PATH/fastlane/Fastfile"

echo "✅ Project '$APP_NAME' initialized at $TARGET_PATH"
echo "👉 Next Steps:"
echo "1. cd $TARGET_PATH"
echo "2. Update YOUR_TEAM_ID in project.yml"
echo "3. Place your AuthKey.p8 in fastlane/ folder"
echo "4. Start your AI Agent in the project folder!"
