-- This is just for fixing the "Highlighting group 'NotifyBackground' has no background highlight" error
-- that shows up for some notifications
return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#2E3440", -- Nordfox's background color
    },
  },
}
