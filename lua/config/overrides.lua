local M = {}

-- LSP
M.mason_lspconfig = {
  ensure_installed = {},
}

-- Linters & Formatters
M.mason_null_ls = {
  ensure_installed = {},
  automatic_installation = {
    exclude = {
      "luacheck",
      "shellcheck",
      "taplo",
    },
  },
}

M.mason_dap = {
  ensure_installed = {
    -- C / C++
    "cppdbg",
  },
  automatic_installation = {
    exclude = {
      "cppdbg",
    },
  },
}

M.cmp = {
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        luasnip = "[Luasnip]",
        nvim_lsp = "[Nvim LSP]",
        buffer = "[Buffer]",
        nvim_lua = "[Nvim Lua]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
}

return M
