return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		-- local custom_theme = require("lualine.themes.base").get({ style = "light" })
		-- custom_theme.normal.c.fg = "#D73A49"
		-- custom_theme.normal.c.bg = "#FAF9F6" -- "none" for transparent
		-- custom_theme.normal.b.fg = "#ff6600"
		-- custom_theme.normal.b.bg = "#FFF5EE"

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = "auto",
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
