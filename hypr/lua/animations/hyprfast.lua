-- HyprFast Enhanced: Lightning fast, buttery smooth, tactile motion

hl.config({
	animations = {
		enabled = true,
	},
})

-- Curves
hl.curve("hyprspring", { type = "spring", mass = 0.8, stiffness = 190, dampening = 22 })
hl.curve("hyprIn", { type = "bezier", points = { { 0.15, 0.85 }, { 0.25, 1 } } })
hl.curve("hyprOut", { type = "bezier", points = { { 0.32, 0 }, { 0.67, 0 } } })
hl.curve("hyprSmooth", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

-- Global throttle
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })

-- Windows — Responsive spring-driven popin (popin 92% prevents ugly scaling)
hl.animation({ leaf = "windows", enabled = true, speed = 8.0, spring = "hyprspring" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 8.0, spring = "hyprspring", style = "popin 92%" })
hl.animation({ leaf = "windowsOut", enabled = false })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 8.0, spring = "hyprspring" })

-- Borders — Clean & static (spinning disabled)
hl.animation({ leaf = "border", enabled = true, speed = 6.0, bezier = "hyprSmooth" })
hl.animation({ leaf = "borderangle", enabled = false })

-- Fades — Fast, subtle transitions
hl.animation({ leaf = "fadeIn", enabled = true, speed = 4.0, bezier = "hyprIn" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3.5, bezier = "hyprOut" })
hl.animation({ leaf = "fade", enabled = true, speed = 4.0, bezier = "hyprSmooth" })

-- Layers & Popups (Waybar, Rofi, Notifications)
hl.animation({ leaf = "layers", enabled = true, speed = 4.5, bezier = "hyprSmooth" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4.5, bezier = "hyprSmooth", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.5, bezier = "hyprOut", style = "fade" })

-- Workspaces — Tactile, high-FPS workspace sliding (replaced slow fade)
hl.animation({ leaf = "workspaces", enabled = true, speed = 4.5, bezier = "hyprSmooth", style = "slide" })

-- Zoom
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6.5, bezier = "hyprIn" })
