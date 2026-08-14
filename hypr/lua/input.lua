hl.config({
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "caps:escape",
    kb_rules     = "",

    follow_mouse = 1,

    sensitivity  = 0,

    repeat_rate  = 50,
    repeat_delay = 200,

    touchpad     = {
      natural_scroll = true,
      scroll_factor  = 1,
    },
  },
}
)

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

hl.device({
  name        = "epic-mouse-v1",
  sensitivity = -0.5,
})
