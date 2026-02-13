local util = require("radioactive.util")

local M = {}

---@class Palette
M.default = {
	none = "NONE",

	-- Background layers
	bg = "#0D1116",
	bg_dark = "#141b22",
	bg_float = "#141b22",
	bg_highlight = "#292e42", -- kept a similar mid-dark tone (no exact match in your palette)

	-- Terminal & black
	terminal_black = "#414868",

	-- Foreground / text layers
	fg = "#ffffff",
	fg_dark = "#b7bfce",
	fg_gutter = "#3b4261",
	fg_gutter_light = "#7081d0",
	comment = "#3b4261",

	-- Dark muted tones
	dark3 = "#6473B7",
	dark5 = "#5866A2",

	-- Bright / accent colors
	bright_cyan = "#39DDFD",
	cyan = "#04d1f9",
	dark_cyan = "#10A1BD",

	magenta = "#fca6ff",
	magenta2 = "#a48cf2",
	magenta3 = "#722f55",
	pink = "#f265b5",
	purple = "#987afb",

	orange = "#e58f2a",
	yellow = "#f1fc79",
	dark_yellow = "#c0c95f",

	green = "#37f499",
	bright_green = "#05ff23",
	dark_green = "#1e2b00",

	red = "#f16c75",
	bright_red = "#f0313e",

	-- Git colors (directly from your palette)
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
---@return ColorScheme
function M.setup()
	local config = require("radioactive.config")
	local palette_name = config.options.palette or "default"

	-- Color Palette
	---@class ColorScheme: Palette
	local colors = M[palette_name] or M.default

	util.bg = colors.bg

	colors.diff = {
		add = util.darken(colors.green, 0.15),
		delete = util.darken(colors.red, 0.15),
		change = util.darken(colors.yellow, 0.15),
		text = colors.cyan,
	}

	colors.git.ignore = colors.dark3
	colors.black = util.darken(colors.bg, 0.8, "#000000")
	colors.border_highlight = util.darken(colors.comment, 0.8)
	colors.border = colors.black

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.bg_dark
	colors.bg_statusline = colors.bg_dark

	-- Sidebar and Floats are configurable
	colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
		or config.options.styles.sidebars == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_float = config.options.styles.floats == "transparent" and colors.none
		or config.options.styles.floats == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_visual = util.darken(colors.comment, 0.4)
	colors.bg_search = colors.comment
	colors.fg_sidebar = colors.fg_dark
	-- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
	colors.fg_float = colors.fg

	colors.error = colors.red
	colors.todo = colors.green
	colors.warning = colors.yellow
	colors.info = colors.comment
	colors.hint = colors.dark_green

	colors.delta = {
		add = util.darken(colors.green, 0.45),
		delete = util.darken(colors.red, 0.45),
	}

	config.options.on_colors(colors)

	return colors
end

return M
