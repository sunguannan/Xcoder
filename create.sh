#!/bin/bash

# Get the absolute path of Xcoder directory to locate templates
XCODER_ROOT=$(cd "$(dirname "$0")"; pwd)
TARGET_DIR=$1

if [ -z "$TARGET_DIR" ]; then
    echo "Usage: ./create.sh <target_directory>"
    echo "Example: ./create.sh ../MyNewApp"
    exit 1
fi

echo "🚀 Xcoder: Initializing new project in $TARGET_DIR..."

# 1. Global Tool Check
command -v brew >/dev/null 2>&1 || { echo "Installing Homebrew..."; /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }
echo "📦 Ensuring XcodeGen, Fastlane, and ios-deploy are installed..."
brew install xcodegen fastlane ios-deploy

# 2. Create Target Structure
mkdir -p "$TARGET_DIR/Sources/XcoderApp"
mkdir -p "$TARGET_DIR/Resources"
mkdir -p "$TARGET_DIR/fastlane"

# 3. Copy Template Files from Xcoder to Target
cp "$XCODER_ROOT/project.yml" "$TARGET_DIR/"
cp "$XCODER_ROOT/.xcoder-instructions.md" "$TARGET_DIR/"
cp "$XCODER_ROOT/fastlane/Fastfile" "$TARGET_DIR/fastlane/"
cp "$XCODER_ROOT/.gitignore" "$TARGET_DIR/"

echo "✅ Project initialized at $TARGET_DIR"
echo "👉 Next Steps:"
echo "1. cd $TARGET_DIR"
echo "2. Update YOUR_TEAM_ID in project.yml"
echo "3. Place your AuthKey.p8 in fastlane/ folder"
echo "4. Start your AI Agent in the project folder!"
