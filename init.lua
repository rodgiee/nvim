-- relative and number autoset
vim.opt.number = true
vim.opt.relativenumber = true

-- colorscheme
vim.cmd.colorscheme("koehler")

-- Map <Esc> to exit terminal mode
vim.api.nvim_set_keymap('t', '<C-w>N', [[<C-\><C-n>]], { noremap = true })

-- Enable relative numbers in netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true   -- keep absolute numbers too (optional)
  end,
})

-- Use Enter instead of Ctrl+y to confirm
 --vim.cmd([[
   --inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
 --]])

-- Force block cursor in all modes
vim.opt.guicursor = ""

-- Ctrl+k and j: allow switching to other window while in terminal mode
vim.keymap.set('t', '<C-w>k', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>j', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>h', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>l', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- netrw keybind
vim.keymap.set('n', '<C-n>', vim.cmd.Ex)


