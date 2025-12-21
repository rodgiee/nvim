-- relative and number autoset
vim.opt.number = true
vim.opt.relativenumber = true

-- colorscheme
vim.cmd.colorscheme("koehler")

-- Enable relative numbers in netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true   -- keep absolute numbers too (optional)
  end,
})

-- Force block cursor in all modes
vim.opt.guicursor = ""

-- Show diagonstic information on cursor hover
vim.o.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

--vim.api.nvim_set_hl(0, 'NormalFloat', {
	--bg='White',
--})
