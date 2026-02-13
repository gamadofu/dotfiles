return {
  -- エラー・警告の一覧表示
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
    },
  },
  -- 括弧の自動閉じ
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- JSX/HTMLタグの自動閉じ・自動リネーム
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = true,
  },
  -- キーバインドヘルプ（Space押して待つと候補表示）
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
}
