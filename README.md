# Red Riot Racing — modern redesign preview

This package preserves the **existing GitHub repository structure**: the website is inside `red-riot-racing/`. The Cloudflare Pages root directory should remain `red-riot-racing`, with no build command and output directory `.`.

## Preview safely
1. **Do not replace the live main branch yet.** Create a branch named `redesign-preview` in GitHub.
2. Upload the contents of this ZIP to that branch, keeping `red-riot-racing/` as the website directory and `.pages.yml` at the repository root.
3. Cloudflare Pages (Git-connected) can create a preview deployment for this branch. Check the preview URL in Cloudflare > Deployments.
4. Once approved, merge the preview branch into `main`. Your existing Cloudflare project and domain remain the same.

## Existing site content
- Site data remains in `red-riot-racing/data/`. No sponsor names, leaders, emails, social links, or car photos were invented.
- The temporary `RR.` wordmark is text only. Replace it with the official team logo when ready.
- No external photographs or generated vehicle images are included. All visual treatments are CSS, HTML, and a simple original SVG favicon.
- Google Fonts are requested from Google at runtime; for a fully self-hosted site, replace with locally licensed font files.
- Pages CMS config `.pages.yml` lives at **repository root** and its data paths point into `red-riot-racing/`, as Pages CMS expects.

## Files
- `red-riot-racing/assets/styles.css`: modern responsive layout
- `red-riot-racing/assets/app.js`: all page templates and menu interactions
- `red-riot-racing/data/*.json`: editable content
- `.pages.yml`: CMS configuration

Note: The original `red-riot-racing/admin/` is preserved for compatibility; Pages CMS login is through https://app.pagescms.org/ once GitHub authorization is configured.
