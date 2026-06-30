-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      width = 110,
      preset = {
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          ---{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- Used by the `header` section
        header = [[
╔════════════════════════════════╗
║ ██████╗░ ░███╗░░░███╗ ██████╗░ ║
║ ██╔══██╗ ░████╗░████║ ██╔══██╗ ║
║ ██║░░██║ ░██╔████╔██║ ██████╔╝ ║
║ ██║░░██║ ░██║╚██╔╝██║ ██╔══██╗ ║
║ ██████╔╝ ░██║░╚═╝░██║ ██║░░██║ ║
║ ╚═════╝░ ░╚═╝░░░░░╚═╝ ╚═╝░░╚═╝ ║
╚════════════════════════════════╝]],
      },
      sections = {
        { section = "header" },
        { title = "bookmarks", section = "keys", gap = 0, padding = 2, indent = 2 },
        { title = "recent files", section = "recent_files", indent = 2, padding = { 2, 0 } },
        {
          pane = 1,
          icon = " ",
          title = "browse repo",
          padding = 1,
          indent = 0,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        {
          section = "terminal",
          cmd = "neofetch",
          pane = 1,
          height = 20,
          padding = { 2, 2 },
          indent = 0,
          ttl = 0,
        },
      },
    },
  },
}
