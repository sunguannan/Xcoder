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
   - Generate at [App Store Connect](https://appstoreconnect.apple.com/access/api) (requires Admin access).
   - Download the `.p8` file. You will need to place this in the `fastlane/` folder of your generated project.
   - Note your **Issuer ID** and **Key ID**.

## 🚀 How to Create a Project
Xcoder acts as a template generator. To create a new iOS project in a sibling directory:
```bash
cd codebase/Xcoder
./install.sh ../MyNewApp
