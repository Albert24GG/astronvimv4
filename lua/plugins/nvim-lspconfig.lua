if true then return {} end
return {
  {
    "neovim/nvim-lspconfig",
    config = function() require "config.lsp" end,
  },
}
