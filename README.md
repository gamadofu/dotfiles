# dotfiles

Ghostty + Neovim + Zellij + Claude Code CLI の開発環境。

## 構成

```
dotfiles/
├── config/
│   ├── nvim/           # Neovim (lazy.nvim + LSP + Codeium)
│   │   ├── init.lua
│   │   └── lua/plugins/
│   ├── ghostty/        # Ghostty ターミナル
│   │   └── config
│   └── zellij/         # Zellij マルチプレクサ
│       ├── config.kdl
│       └── layouts/dev.kdl
├── home/               # ~/ 直下のドットファイル
│   ├── .zshrc
│   ├── .zprofile
│   ├── .gitconfig
│   ├── .vimrc          # サーバ用
│   ├── .bashrc         # サーバ用
│   └── .bash_profile   # サーバ用
├── Brewfile            # brew bundle 用
├── install.sh          # ツールインストール（新Mac用）
└── setup.sh            # シンボリックリンク作成
```

## セットアップ

### 新しい Mac

```bash
git clone https://github.com/gamadofu/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh   # ツールのインストール
./setup.sh     # シンボリックリンク作成
```

### ランタイム管理 (mise)

```bash
# バージョン確認
mise list

# プロジェクト単位でバージョン指定
cd my-project
mise use node@20
mise use ruby@3.3

# グローバルのバージョン変更
mise use --global node@22
```

### Neovim 初回起動

```bash
nvim
# lazy.nvim がプラグインを自動インストール（1-2分待つ）
# :Codeium Auth でAI補完の認証
```

### 開発開始

```bash
zellij --layout dev
# 左: nvim .
# 右上: npm run dev
# 右下: claude
```

## ツール管理

### ランタイムバージョン管理 (mise)

| ランタイム | 管理方法 | グローバルバージョン |
|-----------|---------|-------------------|
| Ruby | mise | `mise use --global ruby@latest` |
| Node.js | mise | `mise use --global node@lts` |
| Bun | mise | `mise use --global bun@latest` |
```bash
# 現在のバージョン確認
mise list

# プロジェクト単位で指定（.mise.toml が作られる）
cd my-project
mise use node@20
mise use ruby@3.3
```

### パッケージ管理

| ツール | 管理方法 |
|-------|---------|
| pnpm | corepack（Node.js同梱）経由 |
| Homebrew パッケージ | Brewfile (`brew bundle`) |
| Neovim プラグイン | lazy.nvim（自動） |
| LSP サーバー | Mason（自動） |
| AI 補完 | Codeium（無料、初回 `:Codeium Auth`） |
| フォーマッタ | biome（プロジェクトの devDependencies） |
| Claude Code CLI | pnpm global |

### キーボード（JIS）

- Ghostty で `macos-option-as-alt = left` に設定
- `\` は右 Option + ¥ で入力
- Neovim のターミナルモードは Esc 2回で抜ける

### 2台目の Mac で同期
```bash
cd ~/dotfiles
git pull
./setup.sh   # シンボリックリンク再作成
mise install  # ランタイムのバージョンを合わせる
```
