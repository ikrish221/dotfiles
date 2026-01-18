return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		enabled = false, -- disable globally
		indent = { char = "│" },
		scope = { enabled = false },
	},
	config = function(_, opts)
		local ibl = require("ibl")
		ibl.setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "html",
			callback = function()
				ibl.setup_buffer(0, {
					enabled = true,
				})
			end,
		})
	end,
}
