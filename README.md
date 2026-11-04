# RED RIOT RACING — WEBSITE PROJECT

A complete multi-page, responsive website for Red Riot Racing, the new McPherson College student Formula SAE team working toward its **2028 competition goal**.

**Important:** Team leadership, mission statement, sponsors, social media profiles, sponsorship packet, emails, vehicle information, updates, and milestones are intentionally unfilled. The site shows explicit placeholders until approved information is entered. No photos or partnerships have been fabricated. The graphic R icon is a temporary site mark, **not** a claim to be the team's official logo.

## What's inside

- `index.html`: Homepage with **future sponsor section**.
- `about.html`: About the team + **mission statement placeholder**.
- `leadership.html`: **Official leadership profiles** (empty until entered).
- `journey.html`: Road to 2028, milestone list, future car image/details.
- `sponsors.html`: Sponsor recognition + **sponsorship packet link/PDF**.
- `updates.html`: Team updates.
- `contact.html`: Team emails, social links, recruitment link.
- `admin/index.html`: convenient link to a **secure GitHub-connected Pages CMS editing dashboard**.
- `.pages.yml`: Pages CMS schema for editing text, photos, PDF links, and data lists.
- `data/*.json`: all editable site content.
- `media/`: upload official photos, approved sponsor logos, packet PDFs.

## Preview on your computer

A browser often blocks reading JSON files directly from `file://` links. Start a local server in the unzipped directory:

```bash
python3 -m http.server 8000
```

Then open `http://localhost:8000`.

## Publish and set up the CMS

1. Make a GitHub account or team organization. Create a repository named, for example, `red-riot-racing-site`. Keep the `.pages.yml` config and all the website files in the **repository root**. Upload all files from this project folder (not just the homepage). Keep the empty `media/.gitkeep` file.
2. Open **Cloudflare Dashboard → Workers & Pages → Create → Pages → Connect to Git**. Select the repository and production branch `main`.
3. For the static site: choose no framework, set **Build command** to `exit 0` (or blank) and **Build output directory** to `.` (the repository root). Deploy. You'll receive a `*.pages.dev` preview URL.
4. In Cloudflare Pages, go to your project → **Custom domains** and add **redriotracing.com**. Follow Cloudflare's exact DNS instructions for your domain registrar and DNS setup. If you want `www.redriotracing.com`, add it separately and configure redirects as desired. Owning the domain alone does not host the website.
5. Visit **https://app.pagescms.org/** and sign in via GitHub. Install/authorize the Pages CMS GitHub App on your repository. Pages CMS reads `.pages.yml` automatically. Select the repository and start editing.
6. When authorized editors save content, Pages CMS commits changes to GitHub. Cloudflare Pages, connected to the GitHub repository, automatically redeploys the updated website.
7. Add official team editors in the appropriate GitHub organization/repository and Pages CMS permissions. **Do not share a GitHub password.** Follow repository permissions policies for the team.

**Admin URL:** Once deployed, `https://redriotracing.com/admin/` opens an informational page with a link to the hosted Pages CMS editor. The actual editor and its sign-in are at `https://app.pagescms.org/`; it is **not hosted on the website itself**. The admin link is public, but only authorized GitHub users can edit the repository.

## Editing checklist (Pages CMS)

- **Website content & links:** Home intro, about text, finalized mission statement, approved team contacts and social accounts, sponsorship packet link, recruitment URL, and car image/details.
- **Leadership:** Add each *confirmed* leader with name, role, bio (optional), and headshot (optional). The page fills automatically.
- **Sponsors:** Add each *confirmed* sponsor, approved logo and website. Sponsor cards display on the homepage **and** on Sponsors.
- **Team updates:** Publish only actual milestones/news; updates show on Home and Updates.
- **Road to 2028 milestones:** Add approved milestone dates and statuses.

### Sponsorship packet PDF

In Pages CMS, upload the official `.pdf` file to the `media` folder. The media output URL will look like `/media/your-packet.pdf`. Copy that URL into **Website content & links → Sponsorship packet URL** and save. The button then appears on the Sponsors page.

### Images

Upload team-authorized images in Pages CMS and select them in image fields. The text-based hero design works without car imagery and deliberately does not show a fictional race car.

### Safety & review

- Never put private personal data, passwords, tokens, or unapproved contact details in public site JSON.
- Content changes become publicly visible when the site redeploys; use review workflows if the team needs approvals.
- The editor can change *content*. More complex design/layout changes require modifying HTML/CSS/JS in the repository.
- The team should verify college name/logo permissions, sponsorship wording, and the Formula SAE competition year and eligibility before public release.

## Changing styles

Edit `assets/styles.css` for typography, color and layout. Default colors are charcoal/black, bright red (`#e12936`) and off-white. Page templates/rendering live in `assets/app.js`.

## Costs

Hosting may fit within Cloudflare Pages' free tier and Pages CMS has a hosted GitHub-connected editor; confirm current account, plan, domain registration/renewal and service limits before committing. The site itself has no paid library or build dependency. Fonts are loaded from Google Fonts online with local system-font fallbacks.

## References

- Pages CMS quick start: https://pagescms.org/docs/quick-start/
- Pages CMS configuration: https://pagescms.org/docs/configuration/
- Cloudflare Pages static HTML: https://developers.cloudflare.com/pages/framework-guides/deploy-anything/


## V3 visual revisions (November 2026)
- New six-item responsive DESIGN / DEVELOP / FABRICATE / TEST / COMPETE / REFINE process band (no clipped scrolling words).
- Home Road to 2028 rebuilt with a complete year and intentional team-car placeholder; no third-party car images.
- Sponsorship headline rebuilt as thin BE PART OF plus bold italic futuristic THE RIOT, responsive and collision-free.
- Leadership statement vertically spaced with a futuristic oblique PEOPLE.
- Public merchandising copy removed all mention of print-on-demand, inventory, suppliers, pricing operations and shipping.
- Futuristic Oxanium and Chakra Petch typefaces loaded via Google Fonts; external fonts require a network connection and fall back to system sans.
- **Install**: replace only the `red-riot-racing` folder in your checked-out `redesign-preview` branch; `.pages.yml` stays at repository root.
