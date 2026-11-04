# Red Riot Racing — Monday presentation edition

Original website layout preserved, with additional red accents, sponsor-only “Be Part of the Riot” CTA, Merch coming-soon page, updated SAE link, and Instagram profile + feed placeholder.

## Deploy safely

This ZIP contains a `red-riot-racing/` folder, root `.pages.yml` and root `README.md`. Replace the **existing `red-riot-racing` folder** in your local GitHub repository while on `redesign-preview`; copy `.pages.yml` to the repository root (Finder hides dotfiles; Cmd+Shift+. usually reveals them). Commit and push `redesign-preview` for a Cloudflare branch preview. Do **not** merge into `main` until reviewed. Cloudflare Pages root directory stays `red-riot-racing` and build output stays `.`.

## Monday checklist

- Replace temporary text-based logo with approved team logo.
- Add approved leadership names, roles, and portraits.
- Add approved mission and team text.
- Add sponsor logos only after confirmation.
- Add confirmed social URLs (Instagram is temporarily @bulldogs_fsae).
- Add team-owned photos only.
- Finalize merch designs, test samples, establish fulfillment/checkout and approval to receive proceeds before opening store.
- For automatic newest Instagram post: connect an approved feed service or authorized Instagram API integration; no live feed is claimed or active in this ZIP.

The Pages CMS configuration is at **repository root**, and its collection paths point into `red-riot-racing/data/`. Content remains editable as JSON even before CMS authorization.


## Instagram post embed
The Updates page now embeds the official Instagram post at https://www.instagram.com/p/DdZ5MH_kUa-/ using Instagram’s embed.js. If Instagram blocks the embed (privacy settings, tracking blockers, browser restrictions), visitors can open the post using the link in the fallback. This is a manually selected featured post, NOT an automatic latest-post feed. To change it, edit `red-riot-racing/data/site.json` -> `instagram_post_url` (and `instagram_url`/`instagram_handle` if the username changes).

Facebook page is linked in the footer and Contact page: https://www.facebook.com/profile.php?id=61595641350852
