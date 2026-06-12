return {

  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = {
              command = { "zsh" },
            },
            python = {
              command = { "ipython", "--no-autoindent" },
              format = common.bracketed_paste_python,
              block_dividers = { "# %%", "#%%" },
              ---env = {PYTHON_BASIC_REPL = "1"}
              ---format = common.bracketed_paste_python,
              ---block_dividers = { "# %%", "#%%" },
            },
          },
          repl_open_cmd = "vertical botright 80 split",
        },

        keymaps = {
          toggle_repl = "<localleader>rr", -- toggles the repl open and closed.
          -- If repl_open_command is a table as ab ove, then the following keymaps are
          -- available
          -- toggle_repl_with_cmd_1 = "<localleader>rv",
          -- toggle_repl_with_cmd_2 = "<localleader>rh",
          restart_repl = "<localleader>rR", -- calls `IronRestart` to restart the repl
          send_motion = "<localleader>sc",
          visual_send = "<localleader>sc",
          send_file = "<localleader>sf",
          send_function = "<localleader>scaf",
          send_line = "<localleader>sl",
          send_paragraph = "<localleader>sp",
          send_until_cursor = "<localleader>su",
          send_mark = "<localleader>sm",
          send_code_block = "<localleader>sb",
          send_code_block_and_move = "<localleader>sn",
          mark_motion = "<localleader>mc",
          mark_visual = "<localleader>mc",
          remove_mark = "<localleader>md",
          cr = "<localleader>s<cr>",
          interrupt = "<localleader>s<space>",
          exit = "<localleader>sq",
          clear = "<localleader>cl",
        },

        highlight = {
          italic = true,
        },

        ignore_blank_lines = false,
      })

      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
      -- send current line and move down
      vim.keymap.set("n", ",", function()
        iron.send_line()
        vim.cmd("normal! j")
      end, { desc = "Send line to REPL" })

      -- send visual selection
      vim.keymap.set("v", ",", function()
        iron.visual_send()
      end, { desc = "Send selection to REPL" })
    end,
  },
}
