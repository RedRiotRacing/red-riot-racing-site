#!/bin/bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$HERE/red-riot-racing"
REPO="$(osascript -e 'POSIX path of (choose folder with prompt "Choose your red-riot-racing-site GitHub repository folder")')"
if [[ ! -d "$REPO/red-riot-racing" ]] || [[ ! -d "$REPO/.git" ]]; then
  osascript -e 'display alert "Wrong folder" message "Choose the repository root red-riot-racing-site (the folder containing .git and red-riot-racing)."'
  exit 1
fi
if [[ ! -f "$REPO/.pages.yml" ]]; then
  osascript -e 'display alert "CMS configuration missing" message "The existing .pages.yml was not found; no files were replaced."'
  exit 1
fi
cd "$REPO"
BRANCH="$(git branch --show-current)"
if [[ "$BRANCH" != "redesign-preview" ]]; then
  osascript -e 'display alert "Switch branches first" message "Use GitHub Desktop to switch to redesign-preview, then run the installer again. Current branch is not redesign-preview."'
  exit 1
fi
if [[ -n "$(git status --porcelain)" ]]; then
  osascript -e 'display alert "Uncommitted changes" message "Commit or stash changes in GitHub Desktop first. No files were replaced."'
  exit 1
fi
BACKUP="$HOME/Desktop/Red-Riot-Racing-Pre-V51-$(date +%Y%m%d-%H%M%S).zip"
/usr/bin/ditto -c -k --sequesterRsrc "$REPO" "$BACKUP"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/preserved"
cp -R "$REPO/red-riot-racing/data" "$TMP/preserved/data"
if [[ -d "$REPO/red-riot-racing/media" ]]; then cp -R "$REPO/red-riot-racing/media" "$TMP/preserved/media"; fi
/usr/bin/ditto "$SOURCE" "$REPO/red-riot-racing"
rm -rf "$REPO/red-riot-racing/data"; /usr/bin/ditto "$TMP/preserved/data" "$REPO/red-riot-racing/data"
if [[ -d "$TMP/preserved/media" ]]; then rm -rf "$REPO/red-riot-racing/media"; /usr/bin/ditto "$TMP/preserved/media" "$REPO/red-riot-racing/media"; fi
osascript -e 'display dialog "V5.1 preview installed on redesign-preview. Your current Pages CMS data, sponsor logos, portraits, media and .pages.yml were preserved. Backup saved to your Desktop. Review the GitHub Desktop changes before committing." buttons {"OK"} default button "OK"'
