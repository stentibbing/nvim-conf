return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		local gruvbox = require("gruvbox")
		local palette = gruvbox.palette
		local styles = {
			floatTitle = { fg = palette.dark0_soft, bg = palette.bright_blue },
			floatBorder = { fg = palette.light4, bg = "NONE" },
		}
		gruvbox.setup({
			terminal_colors = false,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			contrast = "soft",
			palette_overrides = {},
			overrides = {
				SignColumn = { bg = "NONE" },
				EndOfBuffer = { fg = palette.dark0_soft },
				NvimTreeNormal = { bg = "#2d2b2a" },
				NvimTreeEndOfBuffer = { fg = "#2d2b2a" },
				NvimTreeIndentMarker = { fg = palette.dark3 },
				GruvboxRedSign = { fg = palette.red, bg = "NONE" },
				GruvboxGreenSign = { fg = palette.green, bg = "NONE" },
				GruvboxYellowSign = { fg = palette.yellow, bg = "NONE" },
				GruvboxBlueSign = { fg = palette.blue, bg = "NONE" },
				GruvboxPurpleSign = { fg = palette.purple, bg = "NONE" },
				GruvboxAquaSign = { fg = palette.aqua, bg = "NONE" },
				GruvboxOrangeSign = { fg = palette.orange, bg = "NONE" },
				-- window titles
				FloatTitle = styles.floatTitle,
				TelescopePromptTitle = styles.floatTitle,
				TelescopeResultsTitle = styles.floatTitle,
				TelescopePreviewTitle = styles.floatTitle,
				-- window borders
				NormalFloat = styles.floatBorder,
				TelescopeBorder = styles.floatBorder,
				TelescopePromptBorder = styles.floatBorder,
				TelescopeResultsBorder = styles.floatBorder,
				TelescopePreviewBorder = styles.floatBorder,
			},
			dim_inactive = false,
			transparent_mode = false,
		})
	end,
}
