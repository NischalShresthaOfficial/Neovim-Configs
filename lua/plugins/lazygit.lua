return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      {
        "<leader>lg",
        function()
          local ok = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):gsub("%s+", "")
          if ok == "true" then
            vim.cmd("LazyGit")
          else
            vim.notify("⚠️ Not inside a git repository", vim.log.levels.WARN)
          end
        end,
        desc = "Open Lazygit (only in git repos)",
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
