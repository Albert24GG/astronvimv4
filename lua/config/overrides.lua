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
  handlers = {
    cppdbg = function(config)
      local cppdbg_conf = require "config.dap-adapters.cppdbg"

      config.adapters = cppdbg_conf.adapter
      config.configurations = cppdbg_conf.config

      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

M.cmp = function(_, opts)
  opts.formatting = {
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
  }

  opts.sources = require("cmp").config.sources {
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  }

  opts.sorting = {
    comparators = {
      -- Custom kind comparator
      function(entry1, entry2)
        local kind_priority = {
          Field = 1, -- Properties/fields should appear first
          Property = 2,
          Variable = 3, -- Local variables next
          Function = 4, -- Functions and methods are frequently used
          Method = 5,
          Constructor = 6,
          Class = 7, -- Types and classes
          Interface = 8,
          Struct = 9,
          TypeParameter = 10,
          Enum = 11,
          EnumMember = 12,
          Constant = 13, -- Constants and values
          Value = 14,
          Keyword = 15, -- Language constructs
          Operator = 16,
          Reference = 17,
          Module = 18, -- Modules and imports
          File = 19, -- File system items last
          Folder = 20,
          Color = 21,
          Unit = 22,
          Snippet = 23, -- Snippets (can be moved up if you use them frequently)
          Text = 24, -- Generic text completion last
          Event = 25,
        }
        local cmp = require "cmp"
        local kind1 = cmp.lsp.CompletionItemKind[entry1:get_kind()] or ""
        local kind2 = cmp.lsp.CompletionItemKind[entry2:get_kind()] or ""
        local priority1 = kind_priority[kind1] or 50
        local priority2 = kind_priority[kind2] or 50
        if priority1 ~= priority2 then return priority1 < priority2 end
        return nil
      end,
      -- Standard comparators:
      require("cmp.config.compare").offset,
      require("cmp.config.compare").exact,
      require("cmp.config.compare").score,
      require("cmp.config.compare").recently_used, -- promote recently used items
      require("cmp.config.compare").locality, -- items near the cursor
      require("cmp.config.compare").sort_text,
      require("cmp.config.compare").length,
      require("cmp.config.compare").order,
    },
  }
end

return M
