# Red Riot Racing — Expanded Pages CMS

This package builds on V4.5.1; no car images are added.

## Install
1. On the `redesign-preview` branch, replace the repository’s `red-riot-racing/` folder with the one from this ZIP.
2. Copy the ZIP-root `.pages.yml` file to the repository root (next to `red-riot-racing/`). This is essential.
3. Commit and push. In Pages CMS choose `redesign-preview` to test.
4. Open Homepage Editor, fill in a temporary description, save, and confirm the preview site changes; revert the test afterwards.
5. Merge into `main` only after validating the preview.

## Expanded editing
New CMS menus: page-specific editors for Home, About, Leadership, Road to 2028, Sponsors, Updates, Merch, Contact; Navigation & menu; Site-wide announcement and SEO; Sponsor tier headings. Original Settings, Leadership, Sponsors, Updates, Milestones remain.

New page headline overrides are **optional**. Leave them blank to preserve the existing complex V4 headline styling. If you customize a headline, use `|` to separate lines, and `*word*` for emphasis. Changes are applied with the current page’s font and colors, though they may not preserve every original decorative span. Check mobile after editing.

Visibility toggles hide sections, not delete content. Use `true` to show them. Buttons have separately editable labels and destinations. Do not include `↗` in button labels because arrow is retained automatically. URLs must begin with a safe HTTP(S) scheme or be local paths.

Sponsor logos and tier assignment remain editable through the existing Sponsors collection. Existing logo hierarchy remains CSS-defined. The Title Sponsor tier displays only one company. No fake sponsor data is included.

Editors change copy and links, not underlying CSS, geometry, font files, or mechanical website behavior. A few visual components remain code-controlled.

## Important
Pages CMS writes to the selected Git branch. Make sure it is **redesign-preview** during testing, or saving will affect live production. The `.pages.yml` file and `/red-riot-racing/data` files must be on the same branch.
