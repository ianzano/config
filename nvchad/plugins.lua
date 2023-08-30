local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "christoomey/vim-system-copy",
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  }
}

return plugins
