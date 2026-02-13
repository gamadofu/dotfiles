return {
  "tanvirtin/monokai.nvim",
  priority = 1000,
  config = function()
    local monokai = require("monokai")
    local palette = monokai.classic

    monokai.setup({
      palette = palette,
      custom_hlgroups = {
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        LineNr = { bg = "NONE" },
        CursorLineNr = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
      },
    })
  end,
}
