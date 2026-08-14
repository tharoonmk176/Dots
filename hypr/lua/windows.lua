-- Example window rules that are useful

-- local suppressMaximizeRule = hl.window_rule({
--   -- Ignore maximize requests from all apps. Breaks maximize in video players, IDEs, etc.
--   name           = "suppress-maximize-events",
--   match          = { class = ".*" },
--
--   suppress_event = "maximize",
-- })
-- suppressMaximizeRule:set_enabled(true)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = true,
    pin        = false,
  },

  no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  name  = "glava-desktop-widget",
  match = { title = "^GLava$" },

  float            = true,
  pin              = true,
  no_focus         = true,
  no_initial_focus = true,
  no_blur          = true,
  no_shadow        = true,
  border_size      = 0,
})

