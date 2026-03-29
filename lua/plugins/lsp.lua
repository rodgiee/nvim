return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("dartls", {})
      vim.lsp.enable("dartls")
    end,
  },
}
