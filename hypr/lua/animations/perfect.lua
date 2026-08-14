-- Near-Instant & Ultra-Clean: Simple ~100ms smooth fade/slide with zero bloat

hl.config({
	animations = {
		enabled = true,
	},
})

-- Clean ease-out curve (~100ms response)
hl.curve("clean", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })

-- Global speed
hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "clean" })

-- Windows: Simple fast transition (no spring bounce, no popin scaling)
hl.animation({ leaf = "windows", enabled = true, speed = 8.0, bezier = "clean" })

-- Fades: Ultra-quick, subtle fade (~100ms)
hl.animation({ leaf = "fade", enabled = true, speed = 8.0, bezier = "clean" })

-- Workspaces: Fast, direct slide
hl.animation({ leaf = "workspaces", enabled = true, speed = 7.0, bezier = "clean", style = "slide" })

-- Disable non-essential effects
hl.animation({ leaf = "borderangle", enabled = false })
