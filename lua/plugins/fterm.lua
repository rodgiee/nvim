return {
  "numToStr/FTerm.nvim",
  keys = {
    {
      "<leader>t",
      function()
        local fterm = require("FTerm")
        -- p=absolute path; h=parent directory
        -- oil:// is included in path, remove with gsub
        local path = vim.fn.expand("%:p:h"):gsub("^oil://", "")
        fterm.run({ "cd", path })
        fterm.run("clear")
        -- 't' = terminal mode
        vim.keymap.set("t", "<C-q>", fterm.close, {
          --buffer = true,
          --silent = true,
          desc = "Close floating terminal",
        })
      end,
      desc = "Open floating terminal",
    },
  },
}
