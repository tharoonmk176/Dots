#!/usr/bin/env bash
# Hyprland Screenshot Script

set -euo pipefail

# Configuration
SAVE_DIR="${HYPR_SCREENSHOT_DIR:-$HOME/Pictures/Screenshots}"
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
TEMP_FILE=$(mktemp /tmp/screenshot_XXXXXX.png)
FILE_PATH="${SAVE_DIR}/Screenshot_${TIMESTAMP}.png"

MODE="area"       # Default mode: area (s), full (p), window (w), monitor (m)
ACTION="copysave" # Default action: copysave, copy, save, edit

cleanup() {
  rm -f "$TEMP_FILE"
}
trap cleanup EXIT

show_help() {
  cat <<EOF
Usage: $(basename "$0") [MODE] [ACTION] [OPTIONS]

Modes:
  s, area, region, --area, -a      Select area to capture (default)
  p, full, output, --full, -f      Capture full screen/output
  w, window, active, --window, -w  Capture active window
  m, monitor, --monitor, -m        Capture active monitor

Actions:
  copysave, savecopy, --copysave   Save to ~/Pictures/Screenshots AND copy to clipboard (default)
  copy, --copy, -c                 Copy to clipboard only
  save, --save, -s                 Save to file only
  edit, --edit, -e                 Open in annotation tool (swappy/satty)

Examples:
  $(basename "$0") s               # Capture selected region
  $(basename "$0") p               # Capture full screen
  $(basename "$0") w               # Capture active window
  $(basename "$0") s edit          # Capture area and edit in swappy
EOF
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
    s | area | region | --area | -a)
      MODE="area"
      ;;
    p | full | output | --full | -f)
      MODE="full"
      ;;
    w | window | active | --window | -w)
      MODE="window"
      ;;
    m | monitor | --monitor | -m)
      MODE="monitor"
      ;;
    copysave | savecopy | --copysave)
      ACTION="copysave"
      ;;
    copy | --copy | -c)
      ACTION="copy"
      ;;
    save | --save | -s)
      ACTION="save"
      ;;
    edit | --edit | -e)
      ACTION="edit"
      ;;
    -h | --help)
      show_help
      exit 0
      ;;
    *)
      ;;
    esac
    shift
  done
}

parse_args "$@"

check_deps() {
  local missing=()
  if ! command -v grim &>/dev/null; then
    missing+=("grim")
  fi
  if [[ "$MODE" == "area" ]] && ! command -v slurp &>/dev/null; then
    missing+=("slurp")
  fi
  if [[ "$ACTION" =~ copy ]] && ! command -v wl-copy &>/dev/null; then
    missing+=("wl-clipboard")
  fi

  if [[ ${#missing[@]} -gt 0 ]]; then
    local msg="Missing dependencies: ${missing[*]}."
    echo "$msg" >&2
    if command -v notify-send &>/dev/null; then
      notify-send -u critical -a "Screenshot" "Screenshot Error" "$msg\nPlease install: sudo pacman -S grim slurp wl-clipboard swappy jq"
    fi
    exit 1
  fi
}

check_deps

capture() {
  case "$MODE" in
  area)
    local geometry
    geometry=$(slurp -d 2>/dev/null) || exit 0
    if [[ -z "$geometry" ]]; then
      exit 0
    fi
    grim -g "$geometry" "$TEMP_FILE"
    ;;
  full)
    grim "$TEMP_FILE"
    ;;
  window)
    local geometry=""
    if command -v jq &>/dev/null; then
      geometry=$(hyprctl activewindow -j 2>/dev/null | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' 2>/dev/null || true)
    else
      geometry=$(hyprctl activewindow -j 2>/dev/null | python3 -c "import sys, json; d=json.load(sys.stdin); print(f\"{d['at'][0]},{d['at'][1]} {d['size'][0]}x{d['size'][1]}\")" 2>/dev/null || true)
    fi

    if [[ -n "$geometry" && "$geometry" != "null,null nullxnull" && "$geometry" != "0,0 0x0" ]]; then
      grim -g "$geometry" "$TEMP_FILE"
    else
      grim "$TEMP_FILE"
    fi
    ;;
  monitor)
    local mon_name=""
    if command -v jq &>/dev/null; then
      mon_name=$(hyprctl monitors -j 2>/dev/null | jq -r '.[] | select(.focused==true) | .name' 2>/dev/null || true)
    else
      mon_name=$(hyprctl monitors -j 2>/dev/null | python3 -c "import sys, json; mons=json.load(sys.stdin); print(next((m['name'] for m in mons if m.get('focused')), ''))" 2>/dev/null || true)
    fi

    if [[ -n "$mon_name" ]]; then
      grim -o "$mon_name" "$TEMP_FILE"
    else
      grim "$TEMP_FILE"
    fi
    ;;
  esac
}

capture

if [[ ! -s "$TEMP_FILE" ]]; then
  exit 1
fi

notify_user() {
  local title="$1"
  local message="$2"
  local icon="$3"
  if command -v notify-send &>/dev/null; then
    local action_args=()
    if [[ -f "$FILE_PATH" ]]; then
      action_args=(--action="open=Open Image" --action="dir=Open Directory")
    fi
    local choice
    choice=$(notify-send -a "Screenshot" -i "$icon" "${action_args[@]}" "$title" "$message" 2>/dev/null || true)
    case "$choice" in
    open)
      xdg-open "$FILE_PATH" &>/dev/null &
      ;;
    dir)
      xdg-open "$SAVE_DIR" &>/dev/null &
      ;;
    esac
  fi
}

case "$ACTION" in
edit)
  mkdir -p "$SAVE_DIR"
  if command -v swappy &>/dev/null; then
    swappy -f "$TEMP_FILE" -o "$FILE_PATH"
  elif command -v satty &>/dev/null; then
    satty --filename "$TEMP_FILE" --output-filename "$FILE_PATH"
  else
    cp "$TEMP_FILE" "$FILE_PATH"
    if command -v notify-send &>/dev/null; then
      notify-send -u normal -a "Screenshot" "Editor Warning" "Neither swappy nor satty is installed. Saved screenshot to $FILE_PATH"
    fi
  fi

  if [[ -f "$FILE_PATH" ]]; then
    if command -v wl-copy &>/dev/null; then
      wl-copy -t image/png <"$FILE_PATH"
    fi
    notify_user "Screenshot Saved & Copied" "Saved to: $(basename "$FILE_PATH")" "$FILE_PATH"
  fi
  ;;
copysave)
  mkdir -p "$SAVE_DIR"
  cp "$TEMP_FILE" "$FILE_PATH"
  if command -v wl-copy &>/dev/null; then
    wl-copy -t image/png <"$FILE_PATH"
  fi
  notify_user "Screenshot Captured" "Saved to ~/Pictures/Screenshots and copied to clipboard" "$FILE_PATH"
  ;;
copy)
  if command -v wl-copy &>/dev/null; then
    wl-copy -t image/png <"$TEMP_FILE"
  fi
  notify_user "Screenshot Copied" "Copied to clipboard" "$TEMP_FILE"
  ;;
save)
  mkdir -p "$SAVE_DIR"
  cp "$TEMP_FILE" "$FILE_PATH"
  notify_user "Screenshot Saved" "Saved to ~/Pictures/Screenshots/$(basename "$FILE_PATH")" "$FILE_PATH"
  ;;
esac
