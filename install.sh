#!/bin/bash
# Pinchboard 1.14.3 installieren / install
# Quelle: https://github.com/zrsvfr9ytd-lab/pinchboard – vor dem Ausführen lesen / read before running.
#
#   1. Lädt https://github.com/zrsvfr9ytd-lab/pinchboard/releases/download/v1.14.3/Pinchboard-1.14.3.zip
#   2. Prüft die SHA-256-Prüfsumme (bricht bei Abweichung ab)
#   3. Beendet ein laufendes Pinchboard und ersetzt /Applications/Pinchboard.app
#   4. Startet Pinchboard
# curl setzt keine Quarantäne-Markierung, darum fragt macOS beim Öffnen nicht nach.
# Umgebung: PINCHBOARD_ZIEL (Zielordner, Standard /Applications), PINCHBOARD_NICHT_STARTEN=1
set -euo pipefail

VERSION="1.14.3"
URL="https://github.com/zrsvfr9ytd-lab/pinchboard/releases/download/v1.14.3/Pinchboard-1.14.3.zip"
SHA256="bd20628ef8f0d88924d12561fd29657cc94e243cbd14bdf54d7c5d0113cfae59"
ZIEL="${PINCHBOARD_ZIEL:-/Applications}"

meldung() { printf '==> %s\n' "$*"; }
abbruch() { printf 'Fehler: %s\n' "$*" >&2; exit 1; }

[ "$(uname -s)" = "Darwin" ] || abbruch "Pinchboard läuft nur auf macOS."
HAUPT=$(sw_vers -productVersion | cut -d. -f1)
[ "$HAUPT" -ge 26 ] || abbruch "Pinchboard braucht macOS 26 oder neuer (hier: $(sw_vers -productVersion))."
[ -d "$ZIEL" ] && [ -w "$ZIEL" ] || abbruch "$ZIEL ist nicht beschreibbar. Mit PINCHBOARD_ZIEL=~/Applications versuchen."

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

meldung "Lade Pinchboard $VERSION …"
curl -fsSL --proto '=https' --tlsv1.2 -o "$TMP/pinchboard.zip" "$URL"

meldung "Prüfe Prüfsumme …"
IST=$(shasum -a 256 "$TMP/pinchboard.zip" | cut -d' ' -f1)
[ "$IST" = "$SHA256" ] || abbruch "Prüfsumme stimmt nicht (erwartet $SHA256, erhalten $IST). Nichts wurde installiert."

ditto -x -k "$TMP/pinchboard.zip" "$TMP/inhalt"
[ -d "$TMP/inhalt/Pinchboard.app" ] || abbruch "Pinchboard.app fehlt im Archiv."

if [ -z "${PINCHBOARD_NICHT_STARTEN:-}" ] && pgrep -x Pinchboard >/dev/null 2>&1; then
  meldung "Beende laufendes Pinchboard …"
  osascript -e 'tell application id "io.github.zrsvfr9ytd-lab.pinchboard" to quit' >/dev/null 2>&1 || pkill -x Pinchboard || true
  sleep 1
fi

meldung "Installiere nach $ZIEL …"
rm -rf "$ZIEL/Pinchboard.app"
ditto "$TMP/inhalt/Pinchboard.app" "$ZIEL/Pinchboard.app"

if [ -z "${PINCHBOARD_NICHT_STARTEN:-}" ]; then
  meldung "Starte Pinchboard …"
  open "$ZIEL/Pinchboard.app"
fi
meldung "Fertig: Pinchboard $VERSION liegt in $ZIEL."
