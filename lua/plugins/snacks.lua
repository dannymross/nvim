-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      ---width = 60,
      ---- height = 10,
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
          section = "terminal",
          cmd = "date '+%a %b %d' | figlet -f cricket",
          pane = 2,
          width = 80,
          ---height = 10,
        },
        {
          section = "terminal",
          cmd = "pokemon-colorscripts -rn blaziken,snorlax,gengar,mewtwo,luxio,minun,plusle --no-title; sleep .1;",
          random = 1,
          pane = 2,
          indent = 10,
          height = 30,
          width = 80,
        },
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
          pane = 1,
          icon = " ",
          title = "git status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          ---cmd = "git status --short --branch --renames",
          cmd = "git --no-pager diff --stat -B -M -C",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 2,
        },
      },
    },
  },
}
