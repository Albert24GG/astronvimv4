return {
  "AstroNvim/astrocore",
  opts = {
    features = {
      large_buf = false,
    },

    -- vim options can be configured here
    options = {
      opt = {
        wrap = true,
        scrolloff = 5,
      },
    },

    mappings = {
      n = {
        ["<A-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
      },
    },
  },
}
