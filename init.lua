require("config.lazy")

vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })

local function lighten(color, amount)
  local r = bit.rshift(bit.band(color, 0xFF0000), 16)
  local g = bit.rshift(bit.band(color, 0x00FF00), 8)
  local b = bit.band(color, 0x0000FF)
  r = math.min(255, r + amount)
  g = math.min(255, g + amount)
  b = math.min(255, b + amount)
  return string.format("#%02x%02x%02x", r, g, b)
end

local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
if bg then
  vim.api.nvim_set_hl(0, "WinSeparator", {
    fg = lighten(bg, 20),
    bg = "NONE",
  })
else
  vim.api.nvim_set_hl(0, "WinSeparator", {
    fg = "#3a3a3a",
    bg = "NONE",
  })
end
