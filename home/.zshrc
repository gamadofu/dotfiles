# ============================================
# 環境変数
# ============================================
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export EDITOR=nvim
export CLICOLOR=1

# ============================================
# PATH
# ============================================
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Claude Code
export PATH="$HOME/.claude/local:$PATH"

# ============================================
# 補完
# ============================================
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
autoload -Uz compinit && compinit

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ============================================
# 履歴
# ============================================
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups    # 重複を記録しない
setopt share_history       # 複数ターミナルで履歴共有
setopt EXTENDED_HISTORY    # 開始と終了を記録

# ============================================
# オプション
# ============================================
setopt print_eight_bit     # 日本語ファイル名

# ============================================
# エイリアス
# ============================================
alias vi="nvim"
alias vim="nvim"
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias python="python3"

# ============================================
# ツール初期化
# ============================================

# mise (Ruby, Node, Bun 等のバージョン管理)
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# ============================================
# プロンプト (Starship)
# ============================================
eval "$(starship init zsh)"
