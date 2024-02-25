local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "gopls",
  "jsonls",
  "bashls",
  "rust_analyzer",
  "pyright",
  "marksman",
}

for _, lsp in ipairs(servers) do
  local opts_ = {
    capabilities = capabilities,
  }

  lspconfig[lsp].setup(opts_)
end
