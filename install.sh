#!/bin/bash
# Lazy3D – inštalácia jedným príkazom (bez upozornenia macOS, lebo súbor nesťahuje prehliadač).
# Stiahne najnovšiu verziu z GitHubu a dá ju do priečinka Aplikácie.
#   curl -fsSL https://raw.githubusercontent.com/Dionissro/lazy3d-releases/main/install.sh | bash
set -euo pipefail

URL="https://github.com/Dionissro/lazy3d-releases/releases/latest/download/Lazy3D.dmg"
DEST="${LAZY3D_DEST:-/Applications}"
if [ -z "${LAZY3D_DEST:-}" ] && [ ! -w /Applications ]; then
  DEST="$HOME/Applications"
fi
mkdir -p "$DEST"

TMP="$(mktemp -d)"
MNT=""
cleanup() {
  [ -n "$MNT" ] && hdiutil detach "$MNT" -quiet >/dev/null 2>&1 || true
  rm -rf "$TMP"
}
trap cleanup EXIT

echo "Sťahujem Lazy3D…"
curl -fL --progress-bar "$URL" -o "$TMP/Lazy3D.dmg"

echo "Inštalujem do priečinka ${DEST}…"
MNT="$(hdiutil attach -nobrowse -readonly "$TMP/Lazy3D.dmg" | awk -F'\t' '/\/Volumes\// {print $NF}' | tail -1)"
if [ -z "$MNT" ] || [ ! -d "$MNT/Lazy3D.app" ]; then
  echo "CHYBA: inštalačný súbor sa nepodarilo otvoriť." >&2
  exit 1
fi

# bežiacu starú verziu zavrieť (rozpracovaný projekt sa uloží sám)
if [ -z "${LAZY3D_DEST:-}" ]; then
  osascript -e 'tell application "Lazy3D" to quit' >/dev/null 2>&1 || true
  sleep 1
fi

rm -rf "$DEST/Lazy3D.app"
ditto "$MNT/Lazy3D.app" "$DEST/Lazy3D.app"
xattr -dr com.apple.quarantine "$DEST/Lazy3D.app" 2>/dev/null || true

VERSION="$(defaults read "$DEST/Lazy3D.app/Contents/Info.plist" CFBundleShortVersionString 2>/dev/null || echo '?')"
echo "Hotovo – Lazy3D ${VERSION} je v priečinku ${DEST}."
if [ -z "${LAZY3D_DEST:-}" ]; then
  open "$DEST/Lazy3D.app"
fi
