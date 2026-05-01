# Xcoder 🚀
### The AI-Native, Headless iOS Development Framework

**Xcoder** is a streamlined workflow designed for AI Agents (like Claude Code, Cursor, and OpenHands) to build, sign, and deploy iOS applications without ever touching the Xcode GUI.

> "From Prompt to TestFlight, Zero Mouse Clicks."

## 🌟 Key Features
- **Headless First**: Optimized for Mac Mini/Studio home servers.
- **Agent-Ready**: Pre-configured instructions and scripts for LLMs to follow.
- **Declarative Projects**: No more messy `.xcodeproj` merge conflicts. Project structure is defined in `project.yml`.
- **Auto-Distribution**: One-command deployment to TestFlight via Fastlane.

## 🛠 Prerequisites
- A Mac with **Xcode** installed.
- **Apple Developer Program** membership.
- An **App Store Connect API Key** (`.p8` file).

## 🔑 Preparation (Credentials)
Before initializing a project, ensure you have the following from Apple:
1. **Team ID**: Find it at [developer.apple.com](https://developer.apple.com/account/) under "Membership Details".
2. **API Key (.p8)**: 
   - Generate at [Certificates, Identifiers & Profiles > Keys](https://developer.apple.com/account/resources/authkeys/list) (requires Admin access).
   - Download the `.p8` file. You will need to place this in the `fastlane/` folder of your generated project.
   - Note your **Issuer ID** and **Key ID**.
     
## 🚀 How to Create a Project
Xcoder acts as a template generator. To create a new iOS project in a sibling directory:
```bash
cd codebase/Xcoder
chmod +x create.sh
./create.sh ../MyNewApp
```

## 🛠️ Post-Creation Setup
After running create.sh, navigate to your new project and finalize the setup:

CD into project: cd ../MyNewApp.

Set Team ID: Open project.yml and replace YOUR_TEAM_ID with your actual Apple Team ID.

Add API Key: Move your AuthKey_XXXX.p8 file into the fastlane/ folder.

Update Fastfile (Optional): Add your issuer_id and key_id to the upload_to_testflight section in fastlane/Fastfile if not using environment variables.

## 🤖 Agent Workflow
Now, open your AI Agent (Claude Code, Cursor, etc.) inside the MyNewApp folder.

1. The Handoff
The Agent will automatically detect .xcoder-instructions.md and understand how to use the toolchain. You can start by saying:

"Read the instructions and build a simple Pomodoro timer app."

2. Building & Previewing
When the Agent is ready to show you the progress, it will use the pre-configured commands:

To Push to TestFlight: The Agent runs bundle exec fastlane preview. This triggers xcodegen, builds the app, and uploads it to Apple.

To Debug Locally: The Agent runs bundle exec fastlane local to deploy directly to a USB-connected iPhone.

3. Feedback Loop
After you check the app on your iPhone via TestFlight, give feedback to the Agent:

"The start button is too small, make it larger and push a new version."
