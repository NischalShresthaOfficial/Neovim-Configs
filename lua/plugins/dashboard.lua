return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
███    ██ ██    ██  ██████ ██   ██  █████  ██████
████   ██ ██    ██ ██      ██   ██ ██   ██ ██   ██
██ ██  ██ ██    ██ ██      ███████ ███████ ██   ██
██  ██ ██  ██  ██  ██      ██   ██ ██   ██ ██   ██
██   ████   ████    ██████ ██   ██ ██   ██ ██████
          ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
            { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":Telescope find_files cwd=" .. vim.fn.stdpath("config"),
            },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      local colors = require("base46").get_theme_tb("base_30")
      local highlights = {
        SnacksDashboardNormal = { fg = colors.white, bg = colors.black },
        SnacksDashboardHeader = { fg = colors.blue, bold = true },
        SnacksDashboardIcon = { fg = colors.teal },
        SnacksDashboardDesc = { fg = colors.white },
        SnacksDashboardKey = { fg = colors.yellow, bold = true },
        SnacksDashboardFooter = { fg = colors.grey_fg },
        SnacksDashboardSpecial = { fg = colors.purple },
        SnacksDashboardTitle = { fg = colors.sun, bold = true },
      }

      for group, hl in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, hl)
      end
    end,
  },
}
