return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function get_ram_usage()
        local handle = io.popen("vm_stat | grep 'Pages active' | awk '{print $3}' 2>/dev/null")
        if not handle then
          return " N/A"
        end
        local active_pages = handle:read("*a")
        handle:close()
        if not active_pages or active_pages == "" then
          return " N/A"
        end
        local pages = tonumber(active_pages:match("%d+")) or 0
        if pages == 0 then
          return " N/A"
        end
        local mem_mb = (pages * 4096) / (1024 * 1024)
        return string.format(" %.0fMB", mem_mb)
      end
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "|",
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = { added = " ", modified = "柳", removed = " " },
            },
          },
          lualine_c = {
            "filetype",
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              colored = true,
              update_in_insert = false,
            },
            "location",
          },
          lualine_y = {
            "progress",
            { get_ram_usage },
          },
          lualine_z = {
            function()
              local bufnr = vim.api.nvim_get_current_buf()
              local clients = vim.lsp.get_clients({ bufnr = bufnr })
              return next(clients) and clients[1].name or "No LSP"
            end,
          },
        },
      })
    end,
  },
}
