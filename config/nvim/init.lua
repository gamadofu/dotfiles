-- ============================================
-- 基本設定
-- ============================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.scrolloff = 8
opt.undofile = true

-- ============================================
-- lazy.nvim（プラグインマネージャー）自動インストール
-- ============================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================
-- プラグイン読み込み
-- ============================================
require("lazy").setup("plugins")

-- ============================================
-- キーマップ
-- ============================================
local keymap = vim.keymap.set

-- ウィンドウ移動（Ctrl+h/j/k/l）
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- バッファ移動
keymap("n", "<S-h>", ":bprevious<CR>")
keymap("n", "<S-l>", ":bnext<CR>")

-- ESCでハイライト消す
keymap("n", "<Esc>", ":noh<CR>")

-- 保存
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- ターミナルモードから抜ける（Escダブルタップ）
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================
-- 背景透過（Ghosttyの透過を反映させる）
-- ============================================
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn",
      "LineNr", "CursorLineNr", "FloatBorder", "EndOfBuffer" }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end,
})
