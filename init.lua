require("configurations")

-- relative and number autoset
vim.opt.number = true
vim.opt.relativenumber = true

-- ensure netrw directory is synchronized with current working directory
-- helps ensure telescope is looking at current working directory
vim.g.netrw_keepdir = 0

-- Enable relative numbers in netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true   -- keep absolute numbers too (optional)
  end,
})

-- Use Enter instead of Ctrl+y to confirm
vim.cmd([[
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
]])
