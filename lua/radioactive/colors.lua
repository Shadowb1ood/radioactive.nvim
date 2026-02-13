local M = {}
M.colors = {
	none = "NONE",
	bg = "#212337",
	bg_dark = "#171928",
	bg_highlight = "#292e42",
	terminal_black = "#414868",
	fg = "#ebfafa",
	fg_dark = "#ABB4DA",
	fg_gutter = "#3b4261",
	fg_gutter_light = "#7081d0",
	dark3 = "#6473B7",
	comment = "#7081d0",
	dark5 = "#5866A2",
	bright_cyan = "#39DDFD",
	visual = "#76639e",
	bg_visual = "#76639e",
	cyan = "#04d1f9",
	dark_cyan = "#10A1BD",
	magenta = "#a48cf2",
	magenta2 = "#bf4f8e",
	magenta3 = "#722f55",
	pink = "#f265b5",
	purple = "#a48cf2",
	orange = "#f7c67f",
	yellow = "#f1fc79",
	dark_yellow = "#c0c95f",
	green = "#37f499",
	bright_green = "#00FA82",
	dark_green = "#33C57F",
	red = "#f16c75",
	bright_red = "#f0313e",
	git = {
		change = "#7081d0",
		add = "#37f499",
		delete = "#f16c75",
	},
	gitSigns = {
		add = "#37f499",
		change = "#7081d0",
		delete = "#f16c75",
	},
}
function M.setup(opts)
	opts = opts or {}
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.g.colors_name = "radioactive_eldritch"
	local hl = vim.api.nvim_set_hl
	-- Core UI
	hl(0, "Normal", { fg = M.colors.fg, bg = M.colors.bg })
	hl(0, "NormalFloat", { fg = M.colors.fg, bg = M.colors.bg_float })
	hl(0, "NormalNC", { fg = M.colors.fg, bg = M.colors.bg_dark })
	hl(0, "CursorLine", { bg = M.colors.bg_dark })
	hl(0, "CursorLineNr", { fg = M.colors.accent1, bold = true })
	hl(0, "LineNr", { fg = M.colors.comment })
	hl(0, "SignColumn", { bg = M.colors.bg })
	hl(0, "Cursor", { bg = M.colors.cursor })
	hl(0, "CursorIM", { bg = M.colors.cursor })
	hl(0, "Visual", { bg = M.colors.selection })
	hl(0, "VisualNC", { bg = M.colors.selection })
	hl(0, "FloatBorder", { fg = M.colors.accent3, bg = M.colors.bg_float })
	hl(0, "ColorColumn", { bg = M.colors.dark1 })
	hl(0, "Folded", { fg = M.colors.comment, bg = M.colors.bg_dark })
	hl(0, "FoldColumn", { fg = M.colors.comment, bg = M.colors.bg })
	hl(0, "Pmenu", { fg = M.colors.fg, bg = M.colors.bg_dark })
	hl(0, "PmenuSel", { fg = M.colors.fg, bg = M.colors.selection })
	hl(0, "PmenuSbar", { bg = M.colors.bg_dark })
	hl(0, "PmenuThumb", { bg = M.colors.accent1 })
	hl(0, "StatusLine", { fg = M.colors.fg, bg = M.colors.bg_dark })
	hl(0, "StatusLineNC", { fg = M.colors.comment, bg = M.colors.bg_dark })
	hl(0, "TabLine", { fg = M.colors.comment, bg = M.colors.bg_dark })
	hl(0, "TabLineSel", { fg = M.colors.fg, bg = M.colors.bg, bold = true })
	hl(0, "TabLineFill", { bg = M.colors.bg_dark })
	-- Syntax
	hl(0, "Comment", { fg = M.colors.comment, italic = true })
	hl(0, "Constant", { fg = M.colors.accent4 })
	hl(0, "String", { fg = M.colors.accent2 })
	hl(0, "Character", { fg = M.colors.accent2 })
	hl(0, "Number", { fg = M.colors.accent5 })
	hl(0, "Boolean", { fg = M.colors.accent5 })
	hl(0, "Float", { fg = M.colors.accent5 })
	hl(0, "Identifier", { fg = M.colors.accent1 })
	hl(0, "Function", { fg = M.colors.accent3, bold = true })
	hl(0, "Statement", { fg = M.colors.accent6 })
	hl(0, "Conditional", { fg = M.colors.accent6 })
	hl(0, "Repeat", { fg = M.colors.accent6 })
	hl(0, "Operator", { fg = M.colors.accent7 })
	hl(0, "Keyword", { fg = M.colors.accent4, bold = true })
	hl(0, "Exception", { fg = M.colors.accent4 })
	hl(0, "PreProc", { fg = M.colors.accent1 })
	hl(0, "Include", { fg = M.colors.accent1 })
	hl(0, "Define", { fg = M.colors.accent1 })
	hl(0, "Macro", { fg = M.colors.accent1 })
	hl(0, "Type", { fg = M.colors.accent3 })
	hl(0, "StorageClass", { fg = M.colors.accent3 })
	hl(0, "Structure", { fg = M.colors.accent3 })
	hl(0, "Typedef", { fg = M.colors.accent3 })
	hl(0, "Special", { fg = M.colors.accent7 })
	hl(0, "SpecialComment", { fg = M.colors.comment })
	hl(0, "Underlined", { fg = M.colors.accent1, underline = true })
	hl(0, "Error", { fg = M.colors.spellbad, bold = true })
	hl(0, "Todo", { fg = M.colors.accent5, bg = M.colors.dark5, bold = true })
	-- Markdown headings
	hl(0, "markdownH1", { fg = M.colors.accent1, bold = true })
	hl(0, "markdownH2", { fg = M.colors.accent2, bold = true })
	hl(0, "markdownH3", { fg = M.colors.accent3, bold = true })
	hl(0, "markdownH4", { fg = M.colors.accent4, bold = true })
	hl(0, "markdownH5", { fg = M.colors.accent5, bold = true })
	hl(0, "markdownH6", { fg = M.colors.accent6, bold = true })
	hl(0, "markdownCode", { fg = M.colors.accent7 })
	hl(0, "markdownCodeBlock", { bg = M.colors.bg_dark })
	hl(0, "markdownBold", { bold = true })
	hl(0, "markdownItalic", { italic = true })
	hl(0, "markdownLinkText", { fg = M.colors.accent1, underline = true })
	hl(0, "markdownUrl", { fg = M.colors.accent1, underline = true })
	-- LSP / diagnostics
	hl(0, "DiagnosticError", { fg = M.colors.spellbad })
	hl(0, "DiagnosticWarn", { fg = M.colors.accent6 })
	hl(0, "DiagnosticInfo", { fg = M.colors.accent3 })
	hl(0, "DiagnosticHint", { fg = M.colors.accent5 })
	hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = M.colors.spellbad })
	hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = M.colors.accent6 })
	hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = M.colors.accent3 })
	hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = M.colors.accent5 })
	-- Git / Gitsigns
	hl(0, "GitSignsAdd", { fg = M.colors.accent2 })
	hl(0, "GitSignsChange", { fg = M.colors.accent6 })
	hl(0, "GitSignsDelete", { fg = M.colors.spellbad })
	hl(0, "DiffAdd", { fg = M.colors.accent2, bg = M.colors.dark2 })
	hl(0, "DiffChange", { fg = M.colors.accent6, bg = M.colors.dark6 })
	hl(0, "DiffDelete", { fg = M.colors.spellbad, bg = M.colors.dark1 })
	hl(0, "DiffText", { fg = M.colors.accent6, bg = M.colors.dark6 })
	-- Bufferline
	hl(0, "BufferLineFill", { bg = M.colors.bg_dark })
	hl(0, "BufferLineBufferSelected", { fg = M.colors.fg, bold = true })
	hl(0, "BufferLineIndicatorSelected", { fg = M.colors.accent1 })
	hl(0, "BufferLineCloseButtonSelected", { fg = M.colors.spellbad })
	-- Lualine
	hl(0, "LualineNormal", { fg = M.colors.fg, bg = M.colors.bg_dark })
	hl(0, "LualineInsert", { fg = M.colors.bg, bg = M.colors.accent2 })
	hl(0, "LualineVisual", { fg = M.colors.bg, bg = M.colors.accent4 })
	hl(0, "LualineCommand", { fg = M.colors.bg, bg = M.colors.accent3 })
	hl(0, "LualineReplace", { fg = M.colors.bg, bg = M.colors.accent6 })
	hl(0, "LualineInactive", { fg = M.colors.comment, bg = M.colors.bg_dark })
	-- Snacks / UI elements
	hl(0, "SnacksDashboard", { bg = M.colors.bg_dark })
	hl(0, "SnacksPicker", { bg = M.colors.bg_float })
	hl(0, "SnacksTerminal", { bg = M.colors.bg_dark })
	hl(0, "SnacksNotif", { fg = M.colors.accent5, bg = M.colors.dark5 })
	hl(0, "SnacksWin", { fg = M.colors.fg, bg = M.colors.bg_float })
	-- More groups can be added as needed
end
return M
