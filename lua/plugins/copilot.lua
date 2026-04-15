return {
  {
    "github/copilot.vim",
    event = "VimEnter",
    config = function()
      vim.g.copilot_no_tab_map = true

      vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("")', { silent = true, expr = true, noremap = true })

      vim.g.copilot_assume_mapped = true
    end,
  },
}
