#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. Xcode Command Line Tools
if ! xcode-select -p &> /dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "Xcode CLT のインストールが終わったら再度このスクリプトを実行してください"
  exit 1
fi

# 2. Homebrew
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# 3. Brewfile でまとめてインストール
echo "Installing from Brewfile..."
brew bundle --file="${DOTFILES_DIR}/Brewfile"

# 4. mise でランタイムをインストール
echo "Installing runtimes via mise..."
eval "$(mise activate bash)"
mise use --global node@lts
mise use --global ruby@latest
mise use --global bun@latest

# 5. corepack + pnpm
echo "Setting up corepack and pnpm..."
mise exec -- corepack enable
mise exec -- corepack prepare pnpm@latest --activate
# 6. Claude Code CLI
echo "Installing Claude Code CLI..."
pnpm install -g @anthropic-ai/claude-code

# 7. macOS設定
defaults write -g com.apple.trackpad.scaling 20

echo ""
echo "Done! Run ./setup.sh next."
