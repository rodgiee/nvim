-- Ctrl+k and j: allow switching to other window while in terminal mode
vim.keymap.set('t', '<C-w>k', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>j', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>h', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>l', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- Terminal keybind
vim.keymap.set('n', '<leader>t', function() 
	local buffer_file_path = vim.fn.expand('%')
	local buffer_in_directory = vim.fn.isdirectory(buffer_file_path)
	if buffer_in_directory  == 1 then
		vim.cmd('cd %')
	else
		vim.cmd('cd %:h')

	end
	vim.cmd('botright terminal')
	vim.cmd('startinsert')

	print(buffer_file_path)
end)

-- netrw keybind
vim.keymap.set('n', '<C-n>', vim.cmd.Ex)

-- Map <Esc> to exit terminal mode
vim.api.nvim_set_keymap('t', '<C-w>N', [[<C-\><C-n>]], { noremap = true })


-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- LSP keybinds
--vim.keymap.set("n", "gD", function() builtin.lsp_implementations() end)
vim.keymap.set("n", "gd", builtin.lsp_definitions)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

