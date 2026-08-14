hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("fastIn", { type = "bezier", points = { { 0.1, 0.9 }, { 0.2, 1.0 } } })
hl.curve("fastOut", { type = "bezier", points = { { 0.3, 0.0 }, { 0.7, 0.0 } } })
hl.curve("fastSnap", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("fastSpring", { type = "spring", mass = 0.8, stiffness = 200, dampening = 20 })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 8.0, spring = "fastSpring" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 8.0, spring = "fastSpring", style = "popin 90%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 8.0, bezier = "fastOut", style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 8.0, spring = "fastSpring" })
hl.animation({ leaf = "border", enabled = true, speed = 8.0, bezier = "fastSnap" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "linear", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 5.0, bezier = "fastSnap" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 5.0, bezier = "fastIn" })
hl.animation({ leaf = "fadeOut", enabled = false })
hl.animation({ leaf = "layers", enabled = true, speed = 5.0, bezier = "fastSnap" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 5.0, bezier = "fastSnap", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = false })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5.0, bezier = "fastSnap", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 8.0, bezier = "fastIn" })