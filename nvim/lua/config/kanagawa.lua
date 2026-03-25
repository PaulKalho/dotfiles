require("kanagawa").setup({
	compile = false,
	undercurl = true,

	commentStyle = { italic = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },

	transparent = false,

	dimInactive = false,
	terminalColors = true,

	theme = "dragon",

	background = {
		dark = "wave",
		light = "lotus",
	},

	overrides = function(colors)
		return {
			Normal = { bg = "#1f1f28" },
			NormalFloat = { bg = "#1f1f28" },

			["@variable"] = { fg = colors.palette.fujiWhite },
			["@property"] = { fg = colors.palette.waveAqua2 },
			["@function"] = { fg = colors.palette.crystalBlue },
			["@function.method"] = { fg = colors.palette.crystalBlue },
			["@keyword"] = { fg = colors.palette.oniViolet },
			["@tag"] = { fg = colors.palette.carpYellow },
			["@tag.attribute"] = { fg = colors.palette.springBlue },
		}
	end,
})

vim.cmd.colorscheme("kanagawa")
