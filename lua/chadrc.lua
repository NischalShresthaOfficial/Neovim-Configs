---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "kanagawa" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NormalNC = { link = "Normal" },
  },
}

return M
