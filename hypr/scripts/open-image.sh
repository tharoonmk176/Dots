#!/usr/bin/env bash
# Open image using viu inside kitty terminal
# If file path provided as argument ($1), use it. Otherwise, default to latest screenshot.

IMAGE_PATH="${1:-}"

if [[ -z "$IMAGE_PATH" ]]; then
  SAVE_DIR="${HYPR_SCREENSHOT_DIR:-$HOME/Pictures/Screenshots}"
  IMAGE_PATH=$(ls -t "$SAVE_DIR"/*.png "$SAVE_DIR"/*.jpg "$SAVE_DIR"/*.jpeg "$SAVE_DIR"/*.webp 2>/dev/null | head -n 1 || true)
fi

if [[ -z "$IMAGE_PATH" || ! -f "$IMAGE_PATH" ]]; then
  if command -v notify-send &>/dev/null; then
    notify-send -u normal -a "Open Image" "No Image Found" "No image specified and no screenshots found."
  fi
  echo "No image found to display."
  exit 1
fi

kitty --title "Image Viewer" -e bash -c "viu \"$IMAGE_PATH\"; echo ''; read -n 1 -s -r -p 'Press any key to close...'"
