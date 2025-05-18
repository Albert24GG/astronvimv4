return {
  "AstroNvim/astrolsp",
  opts = {
    features = {
      inlay_hints = true,
    },

    formatting = {
      disabled = {
        "serve_d",
      },
    },

    servers = {
      "rust_analyzer",
      "fish_lsp",
      "serve_d",
    },

    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        capabilities = { offsetEncoding = "utf-8" },
        cmd = { "clangd", "--fallback-style=LLVM" },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
            },
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}
