local M = {}

local on_attach = function(client, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    command = "EslintFixAll",
  })
end

M.on_attach = on_attach;

M.settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine"
    },
    showDocumentation = {
      enable = true
    }
  },
  codeActionOnSave = {
    enable = false,
    mode = "all"
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  problems = {
    shortenToSingleLine = false
  },
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location"
  }
}

return M
