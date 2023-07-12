local plugins = {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "rust_analyzer",
        "cssls",
        "eslint",
        "graphql",
        "html",
        "jsonls",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "graphql",

       -- low level
        "c",
        "rust",
      },
    },
  },
}
return plugins
