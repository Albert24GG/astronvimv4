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
    sorting = {
        comparators = {
            require("cmp.config.compare").offset,
            require("cmp.config.compare").exact,
            require("cmp.config.compare").score,
            function(entry1, entry2) -- modified kind comparator (others > snippets > text)
                local kind1 = entry1:get_kind()
                kind1 = kind1 == require("cmp").lsp.CompletionItemKind.Snippet and 99 or kind1
                kind1 = kind1 == require("cmp").lsp.CompletionItemKind.Text and 100 or kind1

                local kind2 = entry2:get_kind()
                kind2 = kind2 == require("cmp").lsp.CompletionItemKind.Snippet and 99 or kind2
                kind2 = kind2 == require("cmp").lsp.CompletionItemKind.Text and 100 or kind2

                if kind1 ~= kind2 then return kind1 < kind2 end
                return nil
            end,
            require("cmp.config.compare").kind,
            require("cmp.config.compare").sort_text,
            require("cmp.config.compare").length,
            require("cmp.config.compare").order,
        },
    },
}

return M
