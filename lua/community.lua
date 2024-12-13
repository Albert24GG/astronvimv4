-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    -- TODO: Remove branch v4 on release
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.cpp" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.python-ruff" },
    { import = "astrocommunity.pack.cmake" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.pack.markdown" },
    -- { import = "astrocommunity.completion.codeium-vim" },
    { import = "astrocommunity.completion.copilot-lua-cmp" },
    { import = "astrocommunity.diagnostics.trouble-nvim" },
    { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    { import = "astrocommunity.editing-support.telescope-undo-nvim" },
    { import = "astrocommunity.git.neogit" },
    { import = "astrocommunity.indent.indent-blankline-nvim" },
    { import = "astrocommunity.motion.leap-nvim" },
    { import = "astrocommunity.motion.nvim-surround" },
    { import = "astrocommunity.register.nvim-neoclip-lua" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
    -- { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
    -- { import = "astrocommunity.utility.noice-nvim" },
    -- { import = "astrocommunity.lsp.nvim-lint" },
    -- { import = "astrocommunity.editing-support.conform-nvim" },

    -- import/override with your plugins folder
}
