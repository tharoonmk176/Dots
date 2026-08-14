-- Minimalistic & Efficient: Ultra-reduced, zero fade distractions, instant response

hl.config({
	animations = {
		enabled = true,
	},
})

-- Sharp Bezier curve
hl.curve("sharp", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

-- Global speed multiplier
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })

-- Windows: Ultra-fast, subtle popin (98% -> 100% in ~50ms)
hl.animation({ leaf = "windows", enabled = true, speed = 10.0, bezier = "sharp" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 10.0, bezier = "sharp", style = "popin 98%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 10.0, bezier = "sharp", style = "popin 98%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 10.0, bezier = "sharp" })

-- Completely disable all distracting fade animations
hl.animation({ leaf = "fade", enabled = false })
hl.animation({ leaf = "fadeIn", enabled = false })
hl.animation({ leaf = "fadeOut", enabled = false })
hl.animation({ leaf = "fadeLayersIn", enabled = false })
hl.animation({ leaf = "fadeLayersOut", enabled = false })

-- Disable non-essential layer and border animations
hl.animation({ leaf = "layers", enabled = false })
hl.animation({ leaf = "border", enabled = false })
hl.animation({ leaf = "borderangle", enabled = false })

-- Workspaces: Ultra-fast direct slide without any fade cross-dissolve
hl.animation({ leaf = "workspaces", enabled = true, speed = 8.0, bezier = "sharp", style = "slide" })

-- Zoom
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 10.0, bezier = "sharp" })
