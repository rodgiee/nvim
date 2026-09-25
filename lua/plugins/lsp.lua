return {
  {
    "neovim/nvim-lspconfig",
    --config = function()
    --vim.lsp.enable("sourcekit")
    -- vim.lsp.config("kotlin_lsp", {
    -- root_dir = function(bufnr, on_dir)
    -- local root = vim.fs.root(bufnr, {
    -- "settings.gradle",
    -- "settings.gradle.kts",
    -- })
    --
    -- if root then
    -- on_dir(root)
    -- end
    -- end,
    -- })
    --
    -- vim.lsp.enable("kotlin_lsp")
    -- end,
  },
}
