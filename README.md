# Pinchboard

**Pinch four fingers, and every app is there.**

Pinchboard lays out all your apps full screen: seven by five per page, with folders and search.
Spread your fingers and you are back on your desktop. The way you remember it. Free.

*[Deutsch weiter unten](#deutsch)*

## What it does
- **Open and close:** pinch your thumb and three fingers together to open the overview, spread them to close it. In between, the view follows your fingers.
- **Grid and pages:** seven by five apps per page. Swipe with two fingers to turn the page, and arrange everything the way you like.
- **Folders:** drag one app onto another to make a folder. Pinchboard suggests a name based on the category.
- **Search:** just start typing. Return opens the first match.
- **Without a trackpad:** the overview also opens with ⌃⌥L or a hot corner.
- **Stays on your Mac:** no account, no ads, no analytics. The only time Pinchboard reaches out on its own is a daily check for updates on GitHub.

Requires macOS 26 or later, Apple silicon or Intel, and a trackpad for the pinch.

## Install
**Homebrew**
```sh
brew install --cask zrsvfr9ytd-lab/pinchboard/pinchboard
```
Get updates with `brew upgrade`.

**Download** – [Pinchboard 1.14.2 (DMG, 2.4 MB)](https://github.com/zrsvfr9ytd-lab/pinchboard/releases/download/v1.14.2/Pinchboard-1.14.2.dmg) or [ZIP](https://github.com/zrsvfr9ytd-lab/pinchboard/releases/download/v1.14.2/Pinchboard-1.14.2.zip), all versions under [Releases](https://github.com/zrsvfr9ytd-lab/pinchboard/releases).
Open the DMG and drag Pinchboard into your Applications folder.

**One command** – downloads the ZIP, verifies its checksum and puts Pinchboard into Applications.
Because curl does not flag downloaded files, macOS does not ask on first launch. That also means you are trusting the script: [have a look at it first](install.sh).
```sh
curl -fsSL https://raw.githubusercontent.com/zrsvfr9ytd-lab/pinchboard/main/install.sh | bash
```

## First launch
Pinchboard is not notarized by Apple. That would take a developer membership at 99 euros a year, and for a free hobby project I am skipping it for now. So macOS warns you the first time you open it (DMG and Homebrew), and you confirm once:

1. Open Pinchboard from Applications. macOS says it could not verify the app. Click “Done”.
2. Open System Settings, go to Privacy & Security and scroll to the bottom. Next to “Pinchboard was blocked”, click “Open Anyway” and confirm with your password or Touch ID.
3. Pinchboard starts and shows you how to grant the Accessibility permission. It keeps the system from opening its own menu on the same gesture.

Or in Terminal: `xattr -dr com.apple.quarantine /Applications/Pinchboard.app`

After an update the prompt may appear once more. The Accessibility permission stays in place, because every version is signed with the same certificate.

## Feedback
In Pinchboard, open the menu and choose **Report a Bug or Idea …**. You see what will be sent before anything leaves your Mac.

## Privacy
Pinchboard collects no usage data. Once a day it asks GitHub whether a new version is available, which sends your IP address and the app version to GitHub. Problem reports are only sent when you send them, to a small feedback service on Cloudflare; your IP address is only used hashed, to fight spam.

## License
Pinchboard is free to use and to pass on unchanged. It comes as is, without any warranty. It uses private macOS interfaces for the trackpad, so a future macOS update may break the pinch.

---

## Deutsch

**Vier Finger zusammen, und alle Apps sind da.**

Pinchboard legt dir alle Apps im Vollbild hin: sieben mal fünf je Seite, mit Ordnern und Suche. Spreizen, und du bist zurück auf dem Schreibtisch. So, wie du es kennst. Kostenlos.

- **Öffnen und schließen:** Daumen und drei Finger zusammenziehen öffnet die Übersicht, spreizen schließt sie. Dazwischen folgt die Ansicht deinen Fingern.
- **Raster und Seiten:** sieben mal fünf Apps je Seite. Mit zwei Fingern blätterst du weiter, die Reihenfolge legst du selbst fest.
- **Ordner:** Zieh eine App auf eine andere, und ein Ordner entsteht. Einen Namen schlägt Pinchboard anhand der Kategorie vor.
- **Suche:** Fang einfach an zu tippen. Die Eingabetaste öffnet den ersten Treffer.
- **Auch ohne Trackpad:** mit ⌃⌥L oder über eine aktive Ecke des Bildschirms.
- **Bleibt auf deinem Mac:** kein Konto, keine Werbung, keine Analyse. Von sich aus meldet sich Pinchboard nur einmal am Tag bei GitHub, um nach Updates zu fragen.

Voraussetzungen: macOS 26 oder neuer, Apple Silicon oder Intel, ein Trackpad für die Fingerbewegung.

### Installieren
- **Homebrew:** `brew install --cask zrsvfr9ytd-lab/pinchboard/pinchboard`, Updates mit `brew upgrade`.
- **Laden:** [DMG](https://github.com/zrsvfr9ytd-lab/pinchboard/releases/download/v1.14.2/Pinchboard-1.14.2.dmg) oder [ZIP](https://github.com/zrsvfr9ytd-lab/pinchboard/releases/download/v1.14.2/Pinchboard-1.14.2.zip) öffnen und Pinchboard in „Programme“ ziehen.
- **Ein Befehl:** `curl -fsSL https://raw.githubusercontent.com/zrsvfr9ytd-lab/pinchboard/main/install.sh | bash` – lädt das ZIP, prüft die Prüfsumme und legt Pinchboard in „Programme“. macOS fragt dabei nicht nach; du vertraust damit dem [Skript](install.sh), schau es dir vorher an.

### Erstes Öffnen
Pinchboard ist nicht von Apple notarisiert. Dafür bräuchte ich eine Mitgliedschaft im Entwicklerprogramm für 99 Euro im Jahr, und bei einem kostenlosen Hobbyprojekt verzichte ich vorerst darauf. Deshalb warnt macOS beim ersten Öffnen, und du bestätigst einmal:

1. Öffne Pinchboard aus „Programme“. macOS meldet, dass die App nicht überprüft werden konnte. Klick auf „Fertig“.
2. Öffne die Systemeinstellungen, dort „Datenschutz & Sicherheit“, und scroll ganz nach unten. Bei „Pinchboard wurde blockiert“ klickst du auf „Trotzdem öffnen“ und bestätigst mit Passwort oder Touch ID.
3. Pinchboard startet und zeigt dir, wie du die Freigabe unter Bedienungshilfen erteilst. Sie verhindert, dass das System bei derselben Geste sein eigenes Menü öffnet.

Im Terminal geht es auch: `xattr -dr com.apple.quarantine /Applications/Pinchboard.app`

### Rückmeldung
In Pinchboard im Menü **Fehler oder Idee melden …** wählen. Du siehst vorher, was gesendet wird.

### Datenschutz
Pinchboard sammelt keine Nutzungsdaten. Einmal am Tag fragt die App bei GitHub nach einer neuen Version; dabei gehen IP-Adresse und App-Version an GitHub. Fehlerberichte gehen nur, wenn du sie abschickst, an einen kleinen Feedback-Dienst bei Cloudflare; deine IP-Adresse wird dort nur gehasht zur Abwehr von Spam verwendet.
