# hugo-saasify-theme

A Hugo theme for SaaS marketing websites: landing, pricing, blog,
docs, careers, company. Tailwind CSS + responsive + i18n with
automatic language detection via [VisitorAPI](https://visitorapi.com/).

- **Demo:** <https://saasify-demo.chaoming.li>
- **License:** MIT
- **Minimum Hugo:** 0.80.0 (extended edition required)

This file is self-contained for working inside this repo. The
`docs/` folder has user-facing guides; this file is the **editor's**
working context.

## What this repo is

This is the **theme**, not a site. The repo ships:

- `layouts/`, `assets/`, `static/`, `i18n/`, `images/` — the theme
  itself (what Hugo loads when a site sets `theme = "hugo-saasify-theme"`).
- `exampleSite/` — a fully working demo site used as the dev harness;
  also serves as the starter template that new users copy from.
- `docs/` — user-facing documentation (9 guides — see below).
- Root-level `package.json`, `tailwind.config.copy.js`,
  `postcss.config.js` — **templates for consumers** to copy into
  their site root during installation. Not used for theme dev.

## Local development workflow

Work happens inside `exampleSite/`, which references the theme via
`theme = "../.."` in `hugo.toml`. No symlinks or submodule wiring
needed.

```bash
cd exampleSite
npm install          # only once
npm start            # Tailwind watch + hugo server -D in parallel
```

The dev server picks up edits to layouts/partials/shortcodes/CSS in
the parent theme directory automatically.

Production build (for the demo site):

```bash
cd exampleSite
npm run build        # tailwindcss --minify + hugo --minify
```

## Layout structure

| Path                      | Role                                                                |
|---------------------------|---------------------------------------------------------------------|
| `layouts/index.html`      | Home page                                                           |
| `layouts/_default/`       | Default page types — `single`, `list`, `baseof`, plus specialised templates: `pricing`, `feature`, `career`, `company`, `job-single`, `simple` |
| `layouts/docs/`           | Documentation pages (sidebar navigation auto-generated)             |
| `layouts/partials/`       | Reusable bits — header, footer, sidebar, language-switcher, post cards, icons, GA/GTM, custom-head |
| `layouts/partials/components/` | Building-block partials used inside shortcodes & layouts        |
| `layouts/shortcodes/`     | 21 page-builder shortcodes (hero, features, pricing, CTA, FAQ, etc.) — see `docs/SHORTCODES.md` |
| `layouts/taxonomy/`       | Tag and category listing pages                                      |
| `assets/css/main.css`     | Tailwind entry — `@tailwind base/components/utilities` + custom CSS |
| `i18n/`                   | Translation files (en, plus whatever languages have been added)     |

## Editing rules

- **Shortcodes are the public page-building API.** When editing a
  shortcode's signature, treat it as a breaking change for consumer
  sites — flag in release notes.
- **i18n strings live in `i18n/<lang>.toml`.** Don't hard-code English
  in layouts; use `{{ i18n "key" }}`. Adding a new string means adding
  it to every existing language file.
- **Tailwind classes only.** No standalone CSS files beyond
  `assets/css/main.css`. Use `@layer` for anything that doesn't fit
  utilities.
- **Two `tailwind.config.js` files exist at root** — `tailwind.config.js`
  (theme dev) and `tailwind.config.copy.js` (template for consumers
  to copy as their site's `tailwind.config.js`). Keep them in sync
  when adding custom colors, fonts, or content paths.
- **Theme version** lives in `theme.toml` (`min_version` is the
  minimum Hugo, not the theme's own version — set a release tag for
  the theme version itself).

## Docs (user-facing)

The `docs/` folder has comprehensive guides for site builders. When
the editor needs to understand a feature deeply, read these first —
they are kept in sync with the code:

| File                          | Covers                                          |
|-------------------------------|-------------------------------------------------|
| `docs/README.md`              | Index                                           |
| `docs/INSTALLATION.md`        | Install methods (new site, existing site, manual) |
| `docs/CONFIGURATION.md`       | All `hugo.toml` options the theme reads         |
| `docs/INTERNATIONALIZATION.md`| i18n setup, language switcher, VisitorAPI integration |
| `docs/LAYOUTS.md`             | How layouts and templates are organised         |
| `docs/SHORTCODES.md`          | Reference for all 21 shortcodes                 |
| `docs/STYLING.md`             | Colors, fonts, custom styles                    |
| `docs/CONTENT-CREATION.md`    | Creating pages, blog posts, content structure   |
| `docs/DEPLOYMENT.md`          | Netlify, Vercel, GitHub Pages, Cloudflare, etc. |
| `docs/TROUBLESHOOTING.md`     | Common issues                                   |

`docs/zh-cn.toml.example` is a starter file for adding Simplified
Chinese — copy to `i18n/zh-cn.toml` in a consumer site (or to
`exampleSite/i18n/` for testing here).

## Consumers (downstream impact)

This theme is consumed in production by other brands in the broader
workspace (e.g. `visitorapi.com`) via git submodule pinned to a
commit on `main`. Implications:

- Breaking changes to shortcode signatures, layout names, or
  required `hugo.toml` keys will silently break consumer sites until
  they bump their submodule pin.
- Bug fixes and additive changes are safe to ship on `main`.
- There's no automated release pipeline today — consumers update
  by bumping their submodule pin manually.

When making a breaking change, mention which consumer brands need
to be updated in the commit message or PR description.

## Release

No automated release pipeline. To "release":

1. Bump `theme.toml` version (currently `1.0.0` per `package.json`).
2. Tag the commit (`git tag vX.Y.Z && git push --tags`).
3. (Optional) Update the listing on the Hugo themes gallery
   (<https://themes.gohugo.io>).

Consumers consume via git submodule pin, not the gallery — the
gallery is for discoverability only.

## VisitorAPI integration note

The theme's language-switcher partial calls VisitorAPI to detect the
visitor's country and pre-select a language. This is an external
dependency baked into the theme — disabling it requires removing the
`language-switcher.html` partial or stubbing the API call. See
`docs/INTERNATIONALIZATION.md` for the on/off switch.
