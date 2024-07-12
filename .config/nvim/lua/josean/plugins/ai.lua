return {
  {
    "github/copilot.vim",
    config = function()
      -- Prevent Copilot from mapping the Tab key by default
      vim.g.copilot_no_tab_map = true

      -- Custom function to check if the previous character is a space
      function _G.check_backspace()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
      end

      -- Custom mapping for the Tab key to accept Copilot suggestions or insert a Tab character
      vim.api.nvim_set_keymap(
        "i",
        "<Tab>",
        'copilot#Accept("<CR>") .. v:lua.check_backspace() ? "\\<Tab>" : ""',
        { expr = true, noremap = true, silent = true }
      )
      -- Map Ctrl+K to accept Copilot suggestions directly
      vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Accept("\\<CR>")', { expr = true, noremap = true, silent = true })
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
}
