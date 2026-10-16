#!/usr/bin/env bash
# tools/render-tiles.sh — the Chrome Web Store's promo tiles, from the SVGs in
# chrome/ into dist/chrome/. Both embed the icon master, so they are stale the
# moment it changes: npm run icons calls this, and so does the Chrome package.
# Needs rsvg-convert (brew install librsvg); without it the tiles are skipped
# with a note, since CI's runners have no librsvg and the zip does not need
# them.
#
# librsvg loads no image outside the SVG's own directory, so it would drop the
# SVGs' ../icons/ reference without a word. Each tile is rendered from a
# staging copy with the icon beside it.

set -euo pipefail
cd "$(dirname "$0")/.."

OUT="${1:-dist/chrome}"
mkdir -p "$OUT"
if ! command -v rsvg-convert >/dev/null; then
  echo "  (promo tiles skipped: rsvg-convert not installed)"
  exit 0
fi

STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
mkdir "$STAGE/icons"
cp icons/icon-original.png "$STAGE/icons/"

render() {
  sed 's|href="\.\./icons/|href="icons/|' "chrome/$1.svg" > "$STAGE/$1.svg"
  rsvg-convert -w "$2" -h "$3" "$STAGE/$1.svg" -o "$OUT/$1-$2x$3.png"
}

render promo-tile 440 280
render marquee 1400 560
echo "  $OUT/  <- promo-tile-440x280.png, marquee-1400x560.png"
