-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        require("config.overrides").mason_lspconfig.ensure_installed
      )
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        require("config.overrides").mason_null_ls.ensure_installed
      )
      opts.automatic_installation = require("config.overrides").mason_null_ls.automatic_installation
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        require("config.overrides").mason_dap.ensure_installed
      )
      opts.automatic_installation = require("config.overrides").mason_dap.automatic_installation
    end,
  },
}
