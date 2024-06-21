return {
  {
    "AckslD/swenv.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    config = function()
      require("swenv").setup({
        get_venvs = function(venvs_path)
          return require("swenv.api").get_venvs(venvs_path)
        end,

        post_set_venv = function()
          vim.cmd("LspRestart")
        end,
      })

      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>Cc", "<cmd>lua require('swenv.api').pick_venv()<CR>", { desc = "Choose Env" })
    end,
  },
}
