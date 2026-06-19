return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "super-tab", -- Options: 'default', 'enter', 'super-tab', 'manual'
      -- You can further customize individual keys here if needed
      ---  ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    },
    completion = {
      menu = {
        auto_show = false,
      },
      documentation = {
        auto_show = false,
      },
      ghost_text = { enabled = false },
    },
  },
}
