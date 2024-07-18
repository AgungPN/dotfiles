-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

---------------------
-- General Keymaps
---------------------

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- override selected text when pasting
keymap.set({ "v", "x" }, "p", [["_dP]])

-- automatically center when next searching keyword
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Navigate Buffers
keymap.set("n", "<tab>", ":bnext<CR>")
keymap.set("n", "<S-tab>", ":bprevious<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- move selected to up or down
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- don't move my cursor when join line
keymap.set("n", "J", "mzJ`z")
-- cursor still in middle when C-d or C-u
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace current word
keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace Current Word" })
-- replace selected words
keymap.set(
  "v",
  "<leader>ss",
  [[y:%s/\V<C-r>=escape(@", '\/')<CR>/<C-r>=escape(@", '\/')<CR>/gI<Left><Left><Left><Left>]],
  { desc = "Replace Selected Words" }
)
----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" }) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" }) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" }) -- list available help tags
keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Search Document Symbols" })
keymap.set("n", "<leader>fw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Search Workspace Symbols" })

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- comment mapping
keymap.set("n", "<leader>/", [[:lua require("Comment.api").toggle.linewise.current()<CR>]], opts)
keymap.set("x", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
-- mapping

-- Toggleterm
keymap.set("n", "<leader>tN", "<cmd>lua _NODE_TOGGLE()<cr>", {
  noremap = true,
  silent = true,
  desc = "Node",
})
keymap.set("n", "<leader>tP", "<cmd>lua _PYTHON_TOGGLE()<cr>", {
  noremap = true,
  silent = true,
  desc = "Python",
})
keymap.set({ "n", "t" }, "<A-i>", "<cmd>ToggleTerm direction=float<cr>", {
  noremap = true,
  silent = true,
  desc = "Float",
})
keymap.set(
  { "n", "t" },
  "<A-h>",
  "<cmd>ToggleTerm size=12 direction=horizontal<cr>",
  { noremap = true, silent = true, desc = "Horizontal" }
)
keymap.set(
  { "n", "t" },
  "<A-v>",
  "<cmd>ToggleTerm size=80 direction=vertical<cr>",
  { noremap = true, silent = true, desc = "Vertical" }
)
