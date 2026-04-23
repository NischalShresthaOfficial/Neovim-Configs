vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      client.server_capabilities.documentHighlightProvider = false
    end
  end,
})

local function set_git_highlights()
  vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
    fg = "#ffffff",
    italic = false,
    bold = false,
  })
  vim.api.nvim_set_hl(0, "St_gitIcons", {
    fg = "#ffffff",
    bold = false,
    italic = false,
  })
end

set_git_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_git_highlights,
})
