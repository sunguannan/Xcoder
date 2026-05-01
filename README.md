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

🔑 Setting Up Credentials
Team ID: Find it at developer.apple.com under "Membership Details".

API Key (.p8):

Go to App Store Connect.

Create a new Key with Admin access.

Download the .p8 file and save it as fastlane/AuthKey.p8.

Note down your Issuer ID and Key ID.


## 🚀 Quick Start
Run the following command on your Mac Mini:
```bash
git clone https://github.com/sunguannan/Xcoder.git
cd Xcoder
./install.sh
