local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = require("custom.configs.lsp.eslint").on_attach,
  settings = require("custom.configs.lsp.eslint").settings,
})


local servers = { "html", "cssls", "graphql", "jsonls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
