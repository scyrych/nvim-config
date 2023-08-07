local plugins = {
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
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust-analyzer",
        "css-lsp",
        "eslint-lsp",
        "graphql-language-service-cli",
        "html-lsp",
        "json-lsp",
        "typescript-language-server"
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
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
		},
  },
}
return plugins
