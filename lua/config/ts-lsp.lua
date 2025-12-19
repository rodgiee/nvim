-- Enable TypeScript via the Language Server Protocol (LSP)
vim.lsp.enable('tsserver')

-- Set the TS config for the LSP
vim.lsp.config('tsserver', {
  -- Make sure this is on your path
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = { 'typescript' },
  -- This is a hint to tell nvim to find your project root from a file within the tree
  root_dir = vim.fs.root(0, {'package.json', '.git'}),
  on_attach = on_attach,
  capabilities = capabilities,
  -- optional settings = {...} go here, refer to language server code: https://github.com/typescript-language-server/typescript-language-server/blob/5c483349b7b4b6f79d523f8f4d854cbc5cec7ecd/src/ts-protocol.ts#L379
})


-- lsp keymaps
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end, {})
