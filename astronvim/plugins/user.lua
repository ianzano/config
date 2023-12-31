return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- }
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>" },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  {
    "christoomey/vim-tmux-navigator",
    opts = {},
    cmd = { "TmuxNavigateLeft", "TmuxNavigateRight", "TmuxNavigateUp", "TmuxNavigateDown" },
  },

  {
    "mrjones2014/smart-splits.nvim",
    opts = {},
    event = "User AstroFile",
  },
}
