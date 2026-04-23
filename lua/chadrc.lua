---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",

  hl_override = {
    Comment = { italic = false },
    ["@comment"] = { italic = false },
    NormalNC = { link = "Normal" },
  },
}

M.nvdash = {
  load_on_startup = false,
}

return M
