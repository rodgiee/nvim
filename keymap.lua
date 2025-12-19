-- Ctrl+k and j: allow switching to other window while in terminal mode
vim.keymap.set('t', '<C-w>k', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>j', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>h', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>l', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

vim.g.mapleader = " " 
vim.keymap.set('n', '<leader>t', function() vim.cmd('botright term') end)

-- netrw keybind
vim.keymap.set('n', '<C-n>', vim.cmd.Ex)

-- Map <Esc> to exit terminal mode
vim.api.nvim_set_keymap('t', '<C-w>N', [[<C-\><C-n>]], { noremap = true })
