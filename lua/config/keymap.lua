-- Ctrl+k and j: allow switching to other window while in terminal mode
vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-w>j", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- Open a terminal in the current file's directory.
vim.keymap.set("n", "<leader>t", function()
  local file = vim.api.nvim_buf_get_name(0)
  if vim.bo.buftype ~= "" or file == "" then
    return
  end
  vim.cmd.cd(vim.fn.fnameescape(vim.fn.fnamemodify(file, ":p:h")))
  vim.cmd("botright terminal")
  vim.cmd("resize -10")
  vim.cmd("startinsert")
end, { desc = "Open terminal in file directory" })

-- Map <Esc> to exit terminal mode
vim.api.nvim_set_keymap("t", "<C-w>N", [[<C-\><C-n>]], { noremap = true })

-- telescope keybinds
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

-- telescope in current buffer directory
vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files({
    hidden = true,
    cwd = utils.buffer_dir(),
    no_ignore = true,
    no_ignore_parent = true,
  })
end, { desc = "Telescope find files in current buffer directory" })

-- telescope in current buffer directory
vim.keymap.set("n", "<leader>fw", function()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true,
  })
end, { desc = "Telescope find files in working directory" })

vim.keymap.set("n", "<leader>fg", function()
  builtin.live_grep({
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true,
  })
end, { desc = "Telescope live grep" })

vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set({ "n", "v" }, "<leader>fW", builtin.grep_string, { desc = "Telescope find under cursor" })

-- LSP keybinds
--vim.keymap.set("n", "gD", function() builtin.lsp_implementations() end)
vim.keymap.set("n", "gd", builtin.lsp_definitions)
vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- debugger
local dap, dapui = require("dap"), require("dapui")
vim.keymap.set("n", "<leader>dt", function()
  require("dapui").toggle()
end)

vim.keymap.set("n", "<leader>dsc", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<leader>dsv", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<leader>dsi", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<leader>dso", function()
  require("dap").step_out()
end)

vim.keymap.set("n", "<leader>dbt", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dbc", function()
  require("dap").clear_breakpoints()
end)

-- visual git
vim.keymap.set("n", "<leader>gb", function()
  require("vgit").toggle_live_blame()
end)
vim.keymap.set("n", "<leader>gd", function()
  require("vgit").buffer_hunk_preview()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gj", function()
  require("vgit").hunk_down()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gk", function()
  require("vgit").hunk_up()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>st", function()
  local current_file = vim.api.nvim_buf_get_name(0)
  if string.find(current_file, "openapi.yaml") then
    vim.cmd("SwaggerPreviewToggle")
  else
    vim.print("No openapi.yaml found for Swagger")
  end
end)
--
-- oil keybind
-- used to be netrw keybind
--vim.keymap.set("n", "<C-n>", vim.cmd.Ex)
