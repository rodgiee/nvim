vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

vim.lsp.enable("lua_ls")

-- sourcekit needed to be manually added since not supported by Mason
-- vim.lsp.enable("sourcekit") will default use neovim/nvim-lspconfig version
-- we want to use our local version here at lsp/sourcekit-revised.lua
vim.lsp.enable("sourcekit-revised")

--vim.api.nvim_create_autocmd('LspAttach',{
--desc = 'LSP Actions',
--callback = function(args)
--vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
--end
--})
