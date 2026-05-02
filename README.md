# Xcoder-For-Agents 🚀
### The AI-Native, Headless iOS Development Framework

**Xcoder-For-Agents** is a streamlined workflow designed for **AI Agents** (such as Claude Code, Cursor, and OpenHands) to build, sign, and deploy iOS applications via terminal, making it perfect for headless Mac Mini/Studio servers.

> "From Prompt to TestFlight, Zero Mouse Clicks."

## 🛠 Prerequisites
- A Mac with **Xcode.app** installed.
- **Apple Developer Program** membership.
- An **App Store Connect API Key** with **Admin** role.

## ⚠️ Critical Setup Flow (The "Anti-Pitfall" Sequence)

To ensure a 100% automated experience for your Agent, follow this specific order **once** for each new app:

### 1. System Environment
Ensure your system is linked to the full Xcode app (not just Command Line Tools):
```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

### 2. Register Bundle ID (Developer Portal)
Before the Agent can upload, the Bundle ID must exist in Apple's system:

Log in to Certificates, Identifiers & Profiles.

Click "+" -> App IDs -> App.

Register your Bundle ID (e.g., com.yourname.MyApp).

### 3. Create App Record (App Store Connect)
Go to App Store Connect > My Apps.

Click "+" -> New App.

Select the Bundle ID you just registered in Step 2.
Note: API Keys often lack 'CREATE' permissions, so this manual "placeholder" is mandatory.

## 🚀 Getting Started
### 1. Initialize the Project
Run the script from the Xcoder folder. You can now define your project name and Bundle ID prefix in one command:
```bash
# Usage: ./create.sh <path> [bundle_id_prefix]
./create.sh ../MyCoolApp com.sunguannan
```

### 2. Add Credentials
cd ../MyCoolApp

Update YOUR_TEAM_ID in project.yml.

Place your AuthKey.json (containing key_id, issuer_id, and .p8 content) into the fastlane/ folder.

### 3. Let the Agent Work
Open your AI Agent (e.g., claudecode) in the project folder and give a prompt:

"Read the instructions and build a SwiftUI dashboard for a weather app."

### 4. Deploy to TestFlight
The Agent will run:
```bash
bundle exec fastlane preview
```

Note: After the first successful push, manually add yourself to the Internal Testing group in App Store Connect to see the app on your phone.

## 🏁 Key Automations Included
✅ Auto-Versioning: Pre-configured with apple-generic system.

✅ Visual Compliance: Built-in compliant AppIcon set and Info.plist template.

✅ Headless Signing: Solidified cert + sigh + update_code_signing_settings pipeline.

## 📄 License
Apache License 2.0.
