require("josean.core")
require("josean.lazy")

-- COLOR SCHEME SETUP
vim.cmd([[colorscheme rose-pine]])
TransparantBackground()
-- -- change color line number
vim.cmd([[hi CursorLineNr guifg=#02EEEE]]) -- change current line number
vim.cmd([[hi LineNr guifg=#988cbb]]) -- change other line number
