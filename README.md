# Xcoder-For-Agents 🚀
### The AI-Native, Headless iOS Development Framework

**Xcoder-For-Agents** is a streamlined workflow designed for **AI Agents** (such as Claude Code, Cursor, and OpenHands) to build, sign, and deploy iOS applications entirely through the command line. By providing pre-configured templates and headless-first scripts, it eliminates the need for Xcode GUI interactions, making it perfect for Mac Mini or Mac Studio home servers.

> "From Prompt to TestFlight, Zero Mouse Clicks."

## 🌟 Key Features
- **Headless-First**: Optimized for remote development servers without a monitor.
- **Zero-Block Automation**: Pre-checks ensure Agents never get stuck on `sudo` or permission prompts during the build process.
- **Declarative Projects**: Project structure is defined in `project.yml` to avoid messy `.xcodeproj` merge conflicts.
- **Pre-set Assets**: Built-in compliant App Icons and `Info.plist` templates to bypass App Store validation hurdles automatically.

## 🛠 Prerequisites
- A Mac with the full **Xcode.app** installed (Note: Command Line Tools alone are insufficient for `agvtool`).
- **Apple Developer Program** membership.
- An **App Store Connect API Key** with **Admin** role.

## ⚠️ Critical One-Time Setup (Do This First!)
To ensure your AI Agent can run autonomously without being blocked by system prompts, you **must** perform these steps manually once:

1.  **Set Xcode Path**: Point your system to the full Xcode app to enable essential versioning and build tools:
    ```bash
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    ```
2.  **Create App Record**: Manually create your App record on [App Store Connect](https://appstoreconnect.apple.com/apps).
    * *Reason*: API Keys often lack the "CREATE" permission required to register a new App ID automatically.
3.  **Credential Format**: Rename your downloaded Apple API Key to `fastlane/AuthKey.json`. Ensure it includes the `key_id` and `issuer_id` for unified authentication.

## 🚀 How to Create a Project
Xcoder-For-Agents acts as a powerful template generator. To initialize a new project in a sibling directory:
```bash
# Inside the Xcoder-For-Agents directory
chmod +x create.sh
./create.sh ../MyNewApp
```

## 🛠️ Post-Creation Setup
Enter Project: cd ../MyNewApp.

Set Team ID: Open project.yml and replace YOUR_TEAM_ID with your actual Apple Team ID.

Add Credentials: Move your AuthKey.json into the fastlane/ folder of the new project.

## 🤖 Agent Workflow
Now, open your AI Agent (Claude Code, Cursor, etc.) inside the generated project folder.

The Handoff: The Agent will automatically detect .xcoder-instructions.md and understand the toolchain and rules.

Building & Previewing:

To Push to TestFlight: The Agent runs bundle exec fastlane preview. This triggers xcodegen, auto-increments the build number, handles code signing, and uploads the build to Apple.

First-Time TestFlight Approval:

After the very first successful push, log in to App Store Connect and add your Apple ID to the Internal Testing group. All future builds will arrive on your phone automatically.

## 🏁 Pitfalls Avoided
This framework is pre-engineered to handle common automation "traps" found during real-world Agent testing:

✅ Versioning: project.yml is pre-configured with the apple-generic system to support automatic build increments.

✅ Missing Assets: Includes a default compliant AppIcon set and Info.plist to pass mandatory App Store checks.

✅ Signing Loop: Uses a solidified cert + sigh + update_code_signing_settings pipeline to ensure builds are signed correctly even when the project is regenerated.

## 📄 License
Licensed under the Apache License, Version 2.0.
