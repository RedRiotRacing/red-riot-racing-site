#!/bin/bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$HERE/red-riot-racing"
REPO="$(osascript -e 'POSIX path of (choose folder with prompt "Choose your red-riot-racing-site GitHub repository folder")')"
if [[ ! -d "$REPO/red-riot-racing" ]] || [[ ! -d "$REPO/.git" ]]; then
  osascript -e 'display alert "Wrong folder" message "Choose your GitHub repository ROOT (red-riot-racing-site), containing both .git and red-riot-racing."'; exit 1
fi
if [[ ! -f "$REPO/.pages.yml" ]]; then
  osascript -e 'display alert "Missing CMS config" message "Existing .pages.yml missing; nothing changed."'; exit 1
fi
cd "$REPO"
if [[ "$(git branch --show-current)" != "redesign-preview" ]]; then
  osascript -e 'display alert "Wrong branch" message "Select redesign-preview in GitHub Desktop first. Nothing changed."'; exit 1
fi
if [[ -n "$(git status --porcelain)" ]]; then
  osascript -e 'display alert "Uncommitted changes" message "Commit or stash any current changes in GitHub Desktop first. Nothing changed."'; exit 1
fi
BACKUP="$HOME/Desktop/Red-Riot-Racing-Pre-V62-$(date +%Y%m%d-%H%M%S).zip"
/usr/bin/ditto -c -k --sequesterRsrc "$REPO" "$BACKUP"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/preserved"
/usr/bin/ditto "$REPO/red-riot-racing/data" "$TMP/preserved/data"
if [[ -d "$REPO/red-riot-racing/media" ]]; then /usr/bin/ditto "$REPO/red-riot-racing/media" "$TMP/preserved/media"; fi
/usr/bin/ditto "$SOURCE" "$REPO/red-riot-racing"
# Overlay original existing CMS files onto fresh site, keeping newly introduced merch-products.json
/usr/bin/ditto "$TMP/preserved/data" "$REPO/red-riot-racing/data"
if [[ -d "$TMP/preserved/media" ]]; then /usr/bin/ditto "$TMP/preserved/media" "$REPO/red-riot-racing/media"; fi
# Add new merchandise collection CMS editor without discarding the current expanded CMS edits.
if ! grep -q '^[- ]*name: merch_products$' "$REPO/.pages.yml"; then
cat >> "$REPO/.pages.yml" <<'YAML'

- name: merch_products
  label: Proposed merchandise items
  type: file
  path: red-riot-racing/data/merch-products.json
  format: json
  list: true
  fields:
  - name: name
    label: Item name
    type: string
    required: true
  - name: category
    label: Category
    type: string
  - name: status
    label: Status / coming soon label
    type: string
  - name: image
    label: Concept image (optional)
    type: image
  - name: visible
    label: Display this concept
    type: boolean
YAML
fi
# Add a separate CMS editor for the Three Rs while preserving the existing .pages.yml settings.
if ! grep -q 'name: editor_three_rs' "$REPO/.pages.yml"; then
cat >> "$REPO/.pages.yml" <<'YAML'

- name: editor_three_rs
  label: About page — Three Rs / Our identity
  type: file
  path: red-riot-racing/data/editor-three-rs.json
  format: json
  fields:
  - name: red
    label: Red — Our roots
    type: text
  - name: riot
    label: Riot — Our approach
    type: text
  - name: racing
    label: Racing — Our ambition
    type: text
YAML
fi
osascript -e 'display dialog "V6.2 preview installed on redesign-preview. Current content, sponsors, leadership, updates and media were preserved. Your emergency backup is on the Desktop. Review in GitHub Desktop before committing." buttons {"OK"} default button "OK"'
