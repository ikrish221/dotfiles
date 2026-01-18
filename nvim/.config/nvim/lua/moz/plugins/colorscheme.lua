return {
	-- NOTE: Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {},
				custom_highlights = {
					Visual = { bg = "#5f5faf", fg = "#C5F6FA", blend = 30 },
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
		end,
	},
	-- NOTE: Rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				-- disable_background = true,
				-- 	disable_nc_background = false,
				-- 	disable_float_background = false,
				-- extend_background_behind_borders = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					ColorColumn = { bg = "#1C1C21" },
					Normal = { bg = "none" }, -- Main background remains transparent
					Pmenu = { bg = "", fg = "#e0def4" }, -- Completion menu background
					PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" }, -- Highlighted completion item
					PmenuSbar = { bg = "#191724" }, -- Scrollbar background
					PmenuThumb = { bg = "#9ccfd8" }, -- Scrollbar thumb
				},
				enable = {
					terminal = false,
					legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},
			})

			-- HACK: set this on the color you want to be persistent
			-- when quit and reopening nvim
			-- vim.cmd("colorscheme rose-pine")
		end,
	},
	-- NOTE: gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		-- priority = 1000 ,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					folds = false,
					operators = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {
					Pmenu = { bg = "" }, -- Completion menu background
				},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
	-- NOTE: Kanagwa

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				colors = {
					palette = {
						-- Override background colors to pure black
						sumiInk0 = "#000000", -- Statusline and floating windows
						sumiInk1 = "#000000", -- Main background
						sumiInk2 = "#0a0a0a", -- Lighter background (colorcolumn, folds)
						sumiInk3 = "#101010", -- Cursorline
						sumiInk4 = "#1a1a1a", -- Line numbers, fold column

						-- Keep all original Kanagawa colors
						fujiWhite = "#DCD7BA",
						oldWhite = "#C8C093",
						waveBlue1 = "#223249",
						waveBlue2 = "#2D4F67",
						winterGreen = "#2B3328",
						winterYellow = "#49443C",
						winterRed = "#43242B",
						winterBlue = "#252535",
						autumnGreen = "#76946A",
						autumnRed = "#C34043",
						autumnYellow = "#DCA561",
						samuraiRed = "#E82424",
						roninYellow = "#FF9E3B",
						waveAqua1 = "#6A9589",
						dragonBlue = "#658594",
						fujiGray = "#727169",
						springViolet1 = "#938AA9",
						oniViolet = "#957FB8",
						crystalBlue = "#7E9CD8",
						springViolet2 = "#9CABCA",
						springBlue = "#7FB4CA",
						lightBlue = "#A3D4D5",
						waveAqua2 = "#7AA89F",
						springGreen = "#98BB6C",
						boatYellow1 = "#938056",
						boatYellow2 = "#C0A36E",
						carpYellow = "#E6C384",
						sakuraPink = "#D27E99",
						waveRed = "#E46876",
						peachRed = "#FF5D62",
						surimiOrange = "#FFA066",
						katanaGray = "#717C7C",
					},
					theme = {
						all = {
							ui = {
								bg_gutter = "none", -- Remove gutter background
								bg = "#000000", -- Pure black background
								bg_dim = "#000000",
								bg_m1 = "#0a0a0a",
								bg_m2 = "#101010",
								bg_m3 = "#1a1a1a",
								bg_p1 = "#0a0a0a",
								bg_p2 = "#101010",
							},
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- Transparent floating windows
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "#000000", fg = theme.ui.fg_dim },
						FloatTitle = { bg = "#000000", fg = theme.ui.special, bold = true },

						-- Darker background for specific elements
						NormalDark = { fg = theme.ui.fg_dim, bg = "#000000" },

						-- Plugin support
						LazyNormal = { bg = "#000000", fg = theme.ui.fg_dim },
						MasonNormal = { bg = "#000000", fg = theme.ui.fg_dim },

						-- Telescope with pure black
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = "none" },
						TelescopePromptBorder = { bg = "none" },
						TelescopeResultsNormal = { bg = "none" },
						TelescopeResultsBorder = { bg = "none" },
						TelescopePreviewNormal = { bg = "none" },
						TelescopePreviewBorder = { bg = "none" },

						-- Popup menu with darker background
						Pmenu = { fg = theme.ui.shade0, bg = "#0a0a0a" },
						PmenuSel = { fg = "NONE", bg = "#101010" },
						PmenuSbar = { bg = "#000000" },
						PmenuThumb = { bg = "#1a1a1a" },

						-- Status line
						StatusLine = { bg = "#000000", fg = theme.ui.fg_dim },
						StatusLineNC = { bg = "#000000", fg = theme.ui.nontext },

						-- Tab line
						TabLine = { bg = "#000000", fg = theme.ui.fg_dim },
						TabLineFill = { bg = "#000000" },
						TabLineSel = { bg = "#0a0a0a", fg = theme.ui.fg },

						-- Line numbers and signs
						LineNr = { fg = theme.ui.nontext, bg = "none" },
						CursorLineNr = { fg = theme.ui.fg_dim, bg = "#101010" },
						SignColumn = { bg = "none" },

						-- Git signs
						GitSignsAdd = { fg = theme.vcs.added, bg = "none" },
						GitSignsChange = { fg = theme.vcs.changed, bg = "none" },
						GitSignsDelete = { fg = theme.vcs.removed, bg = "none" },

						-- Indent guides (invisible by default)
						IndentBlanklineChar = { fg = "#0a0a0a" },
						IndentBlanklineContextChar = { fg = "#1a1a1a" },

						-- Cursor line
						CursorLine = { bg = "#101010" },
						CursorColumn = { bg = "#101010" },

						-- Visual selection
						Visual = { bg = "#1a1a1a" },

						-- Better comment color for black background
						Comment = { fg = "#6e6a5c", italic = true },

						-- Diagnostic virtual text with subtle backgrounds
						DiagnosticVirtualTextError = {
							fg = theme.diag.error,
							bg = "#1a0000",
						},
						DiagnosticVirtualTextWarn = {
							fg = theme.diag.warning,
							bg = "#1a1000",
						},
						DiagnosticVirtualTextInfo = {
							fg = theme.diag.info,
							bg = "#001a1a",
						},
						DiagnosticVirtualTextHint = {
							fg = theme.diag.hint,
							bg = "#00101a",
						},
					}
				end,
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				},
			})
		end,
	},
	-- NOTE: monochrome
	{
		"idr4n/github-monochrome.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				-- Main backgrounds
				hl.Normal = { bg = c.none }
				hl.NormalNC = { bg = c.none }
				hl.NormalFloat = { bg = c.none }
				hl.FloatBorder = { bg = c.none }
				hl.FloatTitle = { bg = c.none }

				-- Telescope
				hl.TelescopeNormal = { bg = c.none }
				hl.TelescopeBorder = { bg = c.none }
				hl.TelescopeTitle = { bg = c.none }
				hl.TelescopePromptNormal = { bg = c.none }
				hl.TelescopePromptBorder = { bg = c.none }
				hl.TelescopePromptTitle = { bg = c.none }
				hl.TelescopePromptPrefix = { bg = c.none }
				hl.TelescopeResultsNormal = { bg = c.none }
				hl.TelescopeResultsBorder = { bg = c.none }
				hl.TelescopeResultsTitle = { bg = c.none }
				hl.TelescopePreviewNormal = { bg = c.none }
				hl.TelescopePreviewBorder = { bg = c.none }
				hl.TelescopePreviewTitle = { bg = c.none }

				-- LSP/Completion menu (nvim-cmp)
				hl.Pmenu = { bg = c.none }
				hl.PmenuSel = { bg = c.none }
				hl.PmenuSbar = { bg = c.none }
				hl.PmenuThumb = { bg = c.none }
				hl.CmpItemAbbr = { bg = c.none }
				hl.CmpItemAbbrMatch = { bg = c.none }
				hl.CmpItemAbbrMatchFuzzy = { bg = c.none }
				hl.CmpItemKind = { bg = c.none }
				hl.CmpItemMenu = { bg = c.none }

				-- Sidebars and special windows
				hl.NvimTreeNormal = { bg = c.none }
				hl.NeoTreeNormal = { bg = c.none }
				hl.LazyNormal = { bg = c.none }
				hl.MasonNormal = { bg = c.none }

				-- Status and tab lines
				hl.StatusLine = { bg = c.none }
				hl.StatusLineNC = { bg = c.none }
				hl.TabLine = { bg = c.none }
				hl.TabLineFill = { bg = c.none }

				-- Line numbers and signs
				hl.SignColumn = { bg = c.none }
				hl.LineNr = { bg = c.none }
				hl.CursorLineNr = { bg = c.none }

				-- Git signs
				hl.GitSignsAdd = { bg = c.none }
				hl.GitSignsChange = { bg = c.none }
				hl.GitSignsDelete = { bg = c.none }
			end,
		},
	},
	-- NOTE: neosolarized
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = false },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = c.bg_dark,
					}
					hl.TelescopePromptBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = "#2C94DD",
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
			})
		end,
	},
	-- NOTE : tokyonight
	{
		"folke/tokyonight.nvim",
		name = "folkeTokyonight",
		-- priority = 1000,
		config = function()
			local transparent = true
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				transparent = transparent,

				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
				},
				on_colors = function(colors)
					colors.bg = transparent and colors.none or bg
					colors.bg_dark = transparent and colors.none or bg_dark
					colors.bg_float = transparent and colors.none or bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = transparent and colors.none or bg_dark
					colors.bg_statusline = transparent and colors.none or bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
		end,
	},
}
