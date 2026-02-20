return {
  'tanvirtin/vgit.nvim',
  dependencies = { 'nvim-lua/plenary.nvim'},
  -- Lazy loading on 'VimEnter' event is necessary.
  event = 'VimEnter',
  config = function() require("vgit").setup({
    keymaps = {
      ['n <leader>gb'] = function() require('vgit').toggle_live_blame() end,
    },
    settings = {
      live_blame = {enabled = false}
    }
  }) end,
}
