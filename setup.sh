#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== dotfiles setup ==="
echo "Source: ${DOTFILES_DIR}"
echo ""

# --- 1. ホーム直下のドットファイル ---
for file in "${DOTFILES_DIR}"/home/.*; do
  name=$(basename "$file")
  [ "$name" = "." ] || [ "$name" = ".." ] || [ "$name" = ".DS_Store" ] && continue

  target="$HOME/$name"

  if [ -L "$target" ]; then
    echo "[skip] $name (already symlink)"
    continue
  fi

  if [ -e "$target" ]; then
    echo "[backup] $name -> ${name}.old"
    mv "$target" "${target}.old"
  fi

  ln -s "$file" "$target"
  echo "[link] $name"
done

# --- 2. ~/.config 以下 (nvim, zellij) ---
mkdir -p "$HOME/.config"

for app_dir in "${DOTFILES_DIR}"/config/*/; do
  app_name=$(basename "$app_dir")

  # Ghosttyは別処理
  [ "$app_name" = "ghostty" ] && continue

  target="$HOME/.config/$app_name"

  if [ -L "$target" ]; then
    echo "[skip] .config/$app_name (already symlink)"
    continue
  fi

  if [ -d "$target" ]; then
    echo "[backup] .config/$app_name -> .config/${app_name}.old"
    mv "$target" "${target}.old"
  fi

  ln -s "$app_dir" "$target"
  echo "[link] .config/$app_name"
done

# --- 3. Ghostty (macOS: ~/Library/Application Support/com.mitchellh.ghostty/) ---
if [ "$(uname)" = "Darwin" ]; then
  ghostty_dir="$HOME/Library/Application Support/com.mitchellh.ghostty"
  ghostty_config="${ghostty_dir}/config"
  ghostty_src="${DOTFILES_DIR}/config/ghostty/config"

  mkdir -p "$ghostty_dir"

  if [ -L "$ghostty_config" ]; then
    echo "[skip] ghostty config (already symlink)"
  else
    if [ -f "$ghostty_config" ]; then
      echo "[backup] ghostty config -> config.old"
      mv "$ghostty_config" "${ghostty_config}.old"
    fi
    ln -s "$ghostty_src" "$ghostty_config"
    echo "[link] ghostty config"
  fi
fi

echo ""
echo "Done! Restart your terminal to apply changes."
