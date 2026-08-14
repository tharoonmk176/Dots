local home = os.getenv("HOME") or ""
local script_dir = home .. "/.config/hypr/scripts"
local screenshot_script = script_dir .. "/screenshot.sh"

return {
	terminal = "kitty",
	fileManager = "kitty -e yazi",
	menu = "rofi -show drun",

	browser = "zen-browser",
	mainMod = "SUPER",
	screenshot_script = screenshot_script,
	open_image_script = script_dir .. "/open-image.sh",
	slurp_cmd = screenshot_script .. " s",
	full_cmd = screenshot_script .. " p",
	window_cmd = screenshot_script .. " w",
	edit_cmd = screenshot_script .. " s edit",
}

