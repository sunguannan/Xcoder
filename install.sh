```bash
#!/bin/bash

echo "🚀 Starting Xcoder Environment Setup..."

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Core Tools
echo "📦 Installing XcodeGen, Fastlane, and ios-deploy..."
brew install xcodegen fastlane ios-deploy

# Create Directory Structure
mkdir -p Sources/XcoderApp Resources fastlane

echo "✅ Environment Ready!"
echo "🔗 Next Step: Place your AuthKey_XXXX.p8 file in the 'fastlane/' directory."
