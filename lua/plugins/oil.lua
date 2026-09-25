return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["<leader>t"] = {
        callback = function()
          local dir = require("oil").get_current_dir()
          if not dir then
            return
          end
          vim.cmd.cd(vim.fn.fnameescape(dir))
          vim.cmd("botright terminal")
          vim.cmd("resize -10")
          vim.cmd("startinsert")
        end,
        desc = "Open terminal in Oil directory",
      },
    },
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  keys = {
    { "<C-n>", "<cmd>Oil<CR>", desc = "navigate to parent" },
  },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
