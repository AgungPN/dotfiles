return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set(
			"n",
			"<leader>hm",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		keymap.set(
			"n",
			"<leader>hl",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Show popup menu harpoon" }
		)
		keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)

		--  Setup copies from ThePrimeagen
		keymap.set("n", "<leader>a", mark.add_file, { desc = "Go to previous harpoon mark" })
		keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end)
		keymap.set("n", "<C-t>", function()
			ui.nav_file(2)
		end)
		keymap.set("n", "<C-n>", function()
			ui.nav_file(3)
		end)
		keymap.set("n", "<C-s>", function()
			ui.nav_file(4)
		end)
	end,
}
