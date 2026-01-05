# MacBook-Setup

## How to use this guide

Follow the sections in order. Each section is a checkpoint; finish one before moving on.

- You need an admin account on the Mac.
- Be online for installs and GitHub access.
- Use Terminal for all commands; open a fresh terminal after installing Homebrew.
- When something fails, re-run the exact step after fixing the error.

## Quick start

Install git first:

```bash
xcode-select --install
```

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

Add the SSH key to GitHub, then:

```bash
ssh -T git@github.com
cd ~/Documents
mkdir -p Projects
cd Projects
git clone git@github.com:songselena000/Macbook-Setup.git
cd Macbook-Setup
```

## System Settings

- Swap control and command key on external keyboard
- Remap CapsLock to Ctrl in Settings -> Keyboard -> Modifier Keys
- Increase keyboard key repeat rate and initial delay

```bash
# Restart to see the change
defaults write -g InitialKeyRepeat -int 12 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

## Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## Install apps and tools

```bash
brew bundle --file ./Brewfile
```

Reminder: run `brew bundle` only after Homebrew is installed.

### Brewfile apps

| App | Purpose |
| --- | --- |
| Google Drive | Cloud file sync and backup for Google Drive. |
| Google Chrome | Primary web browser. |
| Raycast | Mac launcher and productivity shortcuts. |
| Rectangle Pro | Window management and snapping. |
| iTerm2 | Terminal emulator with profiles and shortcuts. |
| Cursor | AI-assisted code editor. |
| ChatGPT | Desktop client for ChatGPT. |
| Codex | Desktop client for OpenAI Codex. |
| Claude Code | Desktop client for Claude Code. |
| The Unarchiver | Extracts common archive formats. |
| AppCleaner | Uninstalls apps and removes leftovers. |
| Expo | Expo tooling for React Native. |
| Expo Orbit | Visual tools for Expo debugging. |
| Scroll Reverser | Separate scroll direction for trackpad vs mouse. |
| WeChat | Messaging client. |
| CapCut | Video editor. |
| Microsoft Edge | Secondary web browser. |
| Visual Studio Code | Code editor. |

### Brewfile CLI tools

| Tool | Purpose |
| --- | --- |
| git | Version control. |
| node | Node.js runtime for JS tooling. |
| zsh | Shell. |
| zinit | Zsh plugin manager. |
| zoxide | Smarter `cd` with frecency. |
| fzf | Fuzzy finder for terminal workflows. |

### Node tools

```bash
npm install -g expo @openai/codex
```

## Post-install checks

- Open key apps once so macOS can register permissions (Terminal, iTerm2, Chrome).
- Sign in to Google Drive/Chrome and any AI desktop apps you use.
- Restart the Mac after installing system-level tools and keyboard settings.

## VSCode Setup

See `vscode_settings.json` and `vscode_setup.md`.

## Updating Brewfile

Use this to sync installed apps/tools back into `Brewfile`:

```bash
brew bundle dump --file ./Brewfile --force
```

## Terminal

- Zinit + powerlevel10k + zsh plugins are in `myzshrc.zshrc`.

### ZSH setup

```bash
cp ./myzshrc.zshrc ~/.zshrc
source ~/.zshrc
```

### iTerm2

- Enable Natural Text Editing: Profile -> Keys -> Presets -> Natural Text Editing

## Config references

Use these as references for manual setup:
- `myvimrc.vimrc`
- `ideavimrc.vimrc`
- `gvimrc.vimrc`
- `myzshrc.zshrc`
