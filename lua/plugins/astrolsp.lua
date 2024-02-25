if true then return {} end
-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend settig up the Lua Language Server (lua_ls) as this provides autocomplete and documentation while editing

---@type LazySpec

return {
  "AstroNvim/astrolsp",
  opts = {
    formatting = { disabled = true },
    diagnostics = { disabled = true },
  },
}
