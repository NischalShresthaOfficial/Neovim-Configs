return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.filters = vim.tbl_deep_extend("force", opts.filters or {}, {
        dotfiles = false,
        git_ignored = false,
        git_clean = false,
        no_buffer = false,
        no_bookmark = false,
        custom = {},
        exclude = {},
      })
    end,
  },
}
