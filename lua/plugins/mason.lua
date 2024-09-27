-- Customize Mason plugins

---@type LazySpec
return {
    -- use mason-lspconfig to configure LSP installations
    {
        "williamboman/mason-lspconfig.nvim",
        -- overrides `require("mason-lspconfig").setup(...)`
        opts = {
            require("config.overrides").mason_lspconfig.ensure_installed,
        },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
        "jay-babu/mason-null-ls.nvim",
        -- overrides `require("mason-null-ls").setup(...)`
        opts = {
            ensure_installed = require("config.overrides").mason_null_ls.ensure_installed,
            automatic_installation = require("config.overrides").mason_null_ls.automatic_installation,
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        -- overrides `require("mason-nvim-dap").setup(...)`
        opts = {
            ensure_installed = require("config.overrides").mason_dap.ensure_installed,
            automatic_installation = require("config.overrides").mason_dap.automatic_installation,
            handlers = require("config.overrides").mason_dap.handlers,
        },
    },
}
