return {
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("dap-go").setup()
      require("dapui").setup()
      require("dap.ext.vscode").load_launchjs(nil, {})

      -- Define signs for breakpoints and stopped states
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

      -- Keymaps
      vim.keymap.set("n", "<F5>", require("dap").continue)
      vim.keymap.set("n", "<F10>", require("dap").step_over)
      vim.keymap.set("n", "<F11>", require("dap").step_into)
      vim.keymap.set("n", "<F12>", require("dap").step_out)
      vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, {
        noremap = true,
        silent = true,
        desc = "Toggle BreakPoint",
      })
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- Configure DAP UI
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
