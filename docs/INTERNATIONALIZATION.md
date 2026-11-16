# Internationalization (i18n) Guide

Complete guide for implementing multilingual support in Hugo Saasify Theme.

## Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
- [Language Preference Persistence](#language-preference-persistence)
- [Translation Keys](#translation-keys)
- [Content Organization](#content-organization)
- [Date Formatting](#date-formatting)
- [Common Issues](#common-issues)
- [Adding a New Language](#adding-a-new-language)

## Overview

Hugo Saasify Theme provides full multilingual support with:
- Automatic language switcher in the header
- Persistent language preference (remembers user's choice)
- 40+ translation keys for UI elements
- Language-specific content directories
- Language-specific menus and parameters
- Date format localization
- Translated blog sidebar, post navigation, and more

## Quick Start

The theme comes with **three fully implemented language examples** in the demo site:
- **English** (`en`) - Default language
- **Chinese** (`zh-cn`) - Complete translation
- **German** (`de`) - Complete translation

You can use these as references when adding your own languages.

### Basic Setup

1. **Configure languages in `hugo.toml`:**

```toml
defaultContentLanguage = "en"

[languages]
  [languages.en]
    languageCode = "en-us"
    languageName = "English"
    title = "Your Site"
    weight = 1
    contentDir = "content"

  [languages.zh-cn]
    languageCode = "zh-cn"
    languageName = "简体中文"
    title = "Your Site"
    weight = 2
    contentDir = "content/zh-cn"
```

**Tip:** Check the demo site's `hugo.toml` for complete English, Chinese, and German configurations you can copy and adapt.

2. **Copy translation files:**

```bash
# Copy English translations (already included in theme)
cp themes/hugo-saasify-theme/i18n/en.toml i18n/en.toml

# Copy Chinese example and rename
cp themes/hugo-saasify-theme/docs/zh-cn.toml.example i18n/zh-cn.toml
```

3. **Create language-specific content:**

```
content/
├── _index.md              # English homepage
├── blog/
│   └── my-post.md         # English blog post
└── zh-cn/
    ├── _index.md          # Chinese homepage
    └── blog/
        └── my-post.md     # Chinese blog post
```

4. **Configure language-specific menus:**

```toml
# English menu
[[languages.en.menu.main]]
  name = "Blog"
  url = "/blog"
  weight = 1

# Chinese menu
[[languages.zh-cn.menu.main]]
  name = "博客"
  url = "/zh-cn/blog"
  weight = 1
```

The language switcher will automatically appear in the header!

## Configuration

### Language Preference Persistence

**New Feature:** The theme now automatically remembers the user's language preference using browser localStorage. This provides a seamless multilingual experience.

#### How It Works

1. **First Visit**: User sees the default language (no redirect)
2. **User Selects Language**: When clicking a language in the switcher:
   - Their preference is saved to localStorage
   - They navigate to the selected language
3. **Return Visits**: On subsequent page loads:
   - The system checks for a saved preference
   - If found, automatically redirects to their preferred language
   - This happens once per session to avoid interfering with manual navigation

#### User Experience Examples

**Scenario 1: New User**
```
1. User lands on https://example.com/ (English, default)
2. Clicks "简体中文" in language switcher
3. Navigates to https://example.com/zh-cn/
4. Preference saved: zh-cn
5. Next visit: automatically redirects to Chinese version
```

**Scenario 2: Deep Links**
```
1. User has preference: zh-cn
2. Clicks link to https://example.com/blog/my-post
3. Auto-redirects to https://example.com/zh-cn/blog/my-post
4. Original path preserved, just language changed
```

**Scenario 3: Manual Navigation**
```
1. User has preference: zh-cn (currently on Chinese site)
2. Types https://example.com/en/contact directly in address bar
3. Sees English contact page (no forced redirect)
4. Can still use language switcher to change languages
```

#### Technical Details

- **Storage**: Uses browser `localStorage` with key `hugo_preferred_language`
- **Fallback**: Works gracefully without JavaScript (standard links still function)
- **Privacy**: Stored locally in user's browser only
- **Session Safety**: Uses `sessionStorage` flag to prevent redirect loops
- **Progressive Enhancement**: Site works perfectly with JavaScript disabled

#### Disabling the Feature

If you want to disable language preference persistence:

1. Remove the script include from `layouts/_default/baseof.html`:
```html
<!-- Remove or comment out these lines: -->
{{ if hugo.IsMultilingual }}
<script src="{{ "js/language-preference.js" | relURL }}"></script>
{{ end }}
```

2. Or delete the file: `static/js/language-preference.js`

The language switcher will still work; it just won't remember the user's choice.

#### Automatic Language Detection with VisitorAPI

**New Feature:** The theme supports automatic language detection using [VisitorAPI](https://visitorapi.com/) to detect the visitor's language based on their location.

##### How It Works

1. **Every Page Load (No Stored Preference)**: If the user has no stored language preference:
   - The system calls VisitorAPI on every page load to detect the visitor's language
   - If a matching language is available, the user is automatically redirected
   - The detected language is stored as their preference for future visits
2. **After Preference is Stored**: Once a language preference is saved (either from auto-detection or manual selection):
   - Uses the stored preference (no API call)
   - Fast redirect based on localStorage
3. **Manual Selection**: User can always override by selecting a different language

##### Setup Instructions

1. **Sign up for VisitorAPI**:
   - Visit [visitorapi.com](https://visitorapi.com/) and create a free account
   - Create a new project to get your Project ID

2. **Add the Project ID to your configuration**:

```toml
[params]
  # VisitorAPI Project ID for automatic language detection
  # Set this to enable auto-detection of visitor's language
  # If not set, language detection will be disabled
  visitorapi_pid = "YOUR_PROJECT_ID_HERE"
```

3. **That's it!** The feature is automatically enabled when the Project ID is configured.

##### How Language Matching Works

The system uses **dynamic language matching** based on the first two characters of language codes. This means it automatically works for any language you add to Hugo without requiring any code changes.

**Matching Logic:**

- VisitorAPI returns language codes like `"en"`, `"zh"`, `"de"`, `"fr"`, `"es"`, `"pt"`, etc.
- The system extracts the first 2 characters from the VisitorAPI response
- It compares these with the first 2 characters of your Hugo language codes
- When they match, the user is redirected to that language

**Examples:**

- VisitorAPI returns `"en"` → Matches Hugo language `"en"` ✓
- VisitorAPI returns `"zh"` or `"zho"` → Matches Hugo language `"zh-cn"` ✓ (both start with "zh")
- VisitorAPI returns `"de"` or `"deu"` → Matches Hugo language `"de"` ✓
- VisitorAPI returns `"pt"` or `"por"` → Matches Hugo language `"pt"` or `"pt-br"` ✓
- VisitorAPI returns `"es"` or `"spa"` → Matches Hugo language `"es"` ✓
- VisitorAPI returns `"fr"` or `"fra"` → Matches Hugo language `"fr"` or `"fr-ca"` ✓

**Adding a New Language:**

When you add a new language to your Hugo site, VisitorAPI auto-detection will automatically work for it:

1. Add the language to your `hugo.toml`:

   ```toml
   [languages.ja]
     languageCode = "ja-jp"
     languageName = "日本語"
     # ... rest of config
   ```

2. That's it! The system will automatically detect visitors from Japan and redirect them to `/ja/` because:
   - VisitorAPI will return `"ja"` or `"jpn"` for Japanese visitors
   - The first 2 characters (`"ja"`) match your Hugo language code `"ja"`
   - No code changes needed

**Technical Details:**

The matching happens in `language-preference.js`:

```javascript
// Extract first 2 characters from VisitorAPI response (e.g., "zh" from "zh" or "zho")
var langPrefix = visitorLang.substring(0, 2);

// Get all available Hugo languages from the language switcher
var languageLinks = document.querySelectorAll('.language-switch-link');

// Compare first 2 characters with each Hugo language
for (var j = 0; j < languageLinks.length; j++) {
    var hugoLang = languageLinks[j].getAttribute('data-lang');
    var hugoPrefix = hugoLang.substring(0, 2);

    if (langPrefix === hugoPrefix) {
        // Match found! Redirect to this language
        detectedLang = hugoLang;
        break;
    }
}
```

This approach ensures:
- No hardcoded language mappings to maintain
- Automatic support for any language you add
- Works with both 2-character codes (`"en"`) and extended codes (`"zh-cn"`)
- Handles VisitorAPI's various language code formats (ISO 639-1 and ISO 639-2)

##### Privacy & Performance

- **API Call**: Called on every page load when no language preference is stored
- **Caching**: Once a language is detected and stored, no more API calls are made
- **Efficient**: After first detection, uses localStorage for instant redirects
- **Fallback**: Works gracefully if API is unavailable
- **No Tracking**: VisitorAPI detects language, doesn't track user behavior
- **User Control**: Users can clear localStorage to reset and re-detect

##### Disabling Auto-Detection

To disable automatic language detection while keeping manual preference persistence:

1. Simply remove or comment out the `visitorapi_pid` parameter from your `hugo.toml`
2. Or set it to an empty string: `visitorapi_pid = ""`

The language preference system will continue to work; it just won't auto-detect on first visit.

### Basic Setup

```toml
# Set the default language
defaultContentLanguage = "en"

# Whether to include default language in URL path
# false: English at / (example.com/)
# true: English at /en/ (example.com/en/)
defaultContentLanguageInSubdir = false
```

### Language-Specific Parameters

Each language can have its own configuration for CTAs, headers, etc:

```toml
[languages.en.params.cta]
  enable = true
  title = "Ready to Get Started?"
  description = "Join companies using our platform"
  [languages.en.params.cta.primary_button]
    text = "Get Started Free"
    url = "/get-started"

[languages.zh-cn.params.cta]
  enable = true
  title = "准备好开始了吗？"
  description = "加入使用我们平台的公司"
  [languages.zh-cn.params.cta.primary_button]
    text = "免费开始"
    url = "/zh-cn/get-started"
```

### Sidebar Configuration

**Important:** Do NOT set title/description/text in global sidebar config, as this overrides i18n translations:

```toml
# ❌ DON'T: This prevents translation
[params.blog.sidebar.recent]
  enable = true
  title = "Recent Articles"  # This overrides i18n

# ✅ DO: Let i18n handle the translations
[params.blog.sidebar.recent]
  enable = true
  count = 5  # Only set non-text configuration
```

### Footer Copyright

The same applies to the footer's copyright line. A site-wide `params.copyright` is used for every language, so leave it unset if the line should be translated. The footer then uses the `copyright` translation key, which receives the current year and the site title:

```toml
# i18n/zh-cn.toml
[copyright]
other = "© {{ .Year }} {{ .SiteName }}。保留所有权利。"
```

To use your own wording per language instead (a legal entity name, or a year range), set it in each language's params. `{year}` is replaced with the current year:

```toml
[languages.en.params]
  copyright = "© 2019–{year} Example Inc. All rights reserved."

[languages.zh-cn.params]
  copyright = "© 2019–{year} Example Inc. 保留所有权利。"
```

## Translation Keys

### Complete List

The theme includes 40+ translation keys. Here are the most important ones:

#### Blog & Content
- `readMore` - "Read More" link text
- `readTime` - Reading time suffix
- `categories` - Categories heading
- `tags` - Tags heading

#### Blog Post
- `tableOfContents` - TOC heading
- `minRead` - Reading time text
- `previousPost` - Previous navigation
- `nextPost` - Next navigation
- `dateFormat` - Date format string

#### Blog Sidebar
- `recentArticles` - Recent articles heading
- `popularTags` - Popular tags heading
- `subscribeNewsletter` - Newsletter heading
- `subscribeDescription` - Newsletter description
- `emailPlaceholder` - Email input placeholder
- `subscribe` - Subscribe button

#### Navigation
- `previous` - Previous page
- `next` - Next page
- `documentation` - Documentation heading
- `language` - Language label

#### Features & Pricing
- `seeItInAction` - Feature demo heading
- `popular` - Popular badge
- `mostPopular` - Most popular badge
- `perMonth` - Pricing suffix

#### Homepage
- `trustedByCompanies` - Company logos heading
- `lovedByTeams` - Testimonials heading

#### Footer
- `copyright` - Copyright line, with `{{ .Year }}` and `{{ .SiteName }}` (see [Footer Copyright](#footer-copyright))

For the complete list with default values, see `themes/hugo-saasify-theme/i18n/en.toml`

### Example Translation File

**i18n/en.toml:**
```toml
[readMore]
other = "Read More"

[minRead]
other = "min read"

[previousPost]
other = "Previous Post"

[nextPost]
other = "Next Post"

[dateFormat]
other = "January 2, 2006"
```

**i18n/zh-cn.toml:**
```toml
[readMore]
other = "阅读更多"

[minRead]
other = "分钟阅读"

[previousPost]
other = "上一篇"

[nextPost]
other = "下一篇"

[dateFormat]
other = "2006年1月2日"
```

## Content Organization

### Directory Structure

```
content/
├── _index.md                    # English homepage
├── blog/
│   ├── post-1.md               # English blog posts
│   └── post-2.md
├── features/
│   └── performance.md          # English feature page
└── zh-cn/                      # Chinese content
    ├── _index.md               # Chinese homepage
    ├── blog/
    │   ├── post-1.md           # Chinese blog posts
    │   └── post-2.md
    └── features/
        └── performance.md      # Chinese feature page
```

### Creating Translated Content

1. **Duplicate the structure** from your default language
2. **Translate the content** including front matter
3. **Keep the same file names** for better URL consistency

**Example - English post:**
```yaml
---
title: "Getting Started with Hugo"
date: 2024-01-15
categories: ["Tutorial"]
tags: ["hugo", "web development"]
---
Content in English...
```

**Example - Chinese post:**
```yaml
---
title: "Hugo入门指南"
date: 2024-01-15
categories: ["教程"]
tags: ["hugo", "网站开发"]
---
中文内容...
```

## Date Formatting

The theme uses the `dateFormat` i18n key for locale-specific date formatting:

```toml
# English format
[dateFormat]
other = "January 2, 2006"  # Output: July 20, 2023

# Chinese format
[dateFormat]
other = "2006年1月2日"  # Output: 2023年7月20日

# French format example
[dateFormat]
other = "2 January 2006"  # Output: 20 juillet 2023
```

Hugo's date format reference:
- `2006` - Year (4 digits)
- `06` - Year (2 digits)
- `January` - Month (full name)
- `Jan` - Month (abbreviated)
- `01` - Month (2 digits)
- `1` - Month (1-2 digits)
- `02` - Day (2 digits)
- `2` - Day (1-2 digits)
- `Monday` - Weekday (full name)
- `Mon` - Weekday (abbreviated)

## Common Issues

### Issue: Sidebar Still Showing English

**Problem:** Blog sidebar shows English text even in Chinese version.

**Solution:** Remove hardcoded titles from global `[params.blog.sidebar]` configuration. The theme's i18n will handle the translations automatically.

```toml
# Remove these from global config:
[params.blog.sidebar.recent]
  enable = true
  # title = "Recent Articles"  ← Remove this
  count = 5
```

### Issue: Language Switcher Not Appearing

**Problem:** Language switcher doesn't show in header.

**Solution:** Ensure you have defined multiple languages in your `hugo.toml`:

```toml
[languages]
  [languages.en]
    # ...
  [languages.zh-cn]
    # ...
```

The language switcher automatically appears when 2+ languages are configured.

### Issue: Wrong Language on Home Link

**Problem:** Logo/home link goes to wrong language homepage.

**Solution:** This is already fixed in the theme. The header uses `{{ "/" | relLangURL }}` which automatically links to the correct language homepage.

## Adding a New Language

Let's add French as an example.

### Quick Reference (For Experienced Users)

If you're familiar with Hugo i18n, here's what you need:

1. **Config:** `hugo.toml` - Add `languages.fr` section with `languageCode`, `languageName`, `title`, `weight`, `contentDir`
2. **Translations:** `i18n/fr.toml` - Copy from `i18n/en.toml` and translate all keys
3. **Content:** `content/fr/` - Create directory structure and translate content
4. **Menus:** `languages.fr.menu.main` + 3 footer menus
5. **Params:** `languages.fr.params` - **Must include**: `cta`, `footer` (with uppercase column titles), `header`, `blog`

**Critical:** Don't forget the `footer` configuration - it's required for footer to display correctly!

### Detailed Step-by-Step Guide

### 1. Add Language Configuration

```toml
[languages.fr]
  languageCode = "fr-fr"
  languageName = "Français"
  title = "Votre Site"
  weight = 3
  contentDir = "content/fr"
```

### 2. Create Translation File

Copy the example and translate:

```bash
cp themes/hugo-saasify-theme/docs/zh-cn.toml.example i18n/fr.toml
```

Edit `i18n/fr.toml`:
```toml
[readMore]
other = "Lire la suite"

[minRead]
other = "min de lecture"

[previousPost]
other = "Article précédent"

[nextPost]
other = "Article suivant"

[dateFormat]
other = "2 January 2006"

[recentArticles]
other = "Articles récents"

[categories]
other = "Catégories"

[popularTags]
other = "Tags populaires"

# ... translate all keys
```

### 3. Create French Content

```
content/fr/
├── _index.md
├── blog/
└── features/
```

### 4. Configure French Menu

```toml
[[languages.fr.menu.main]]
  name = "Fonctionnalités"
  url = "/fr/features"
  weight = 1

[[languages.fr.menu.main]]
  name = "Blog"
  url = "/fr/blog"
  weight = 2
```

### 5. Language-Specific Parameters (Required)

Configure language-specific parameters for your new language. **Important:** These parameters are required for proper navigation and UI display.

```toml
# French language specific params
[languages.fr.params]
  # Global CTA Configuration
  [languages.fr.params.cta]
    enable = true
    title = "Prêt à commencer?"
    description = "Rejoignez les entreprises qui utilisent notre plateforme"
    gradient_from = "#2563eb"
    gradient_to = "#7c3aed"
    gradient_angle = 30
    [languages.fr.params.cta.primary_button]
      text = "Commencer"
      url = "/fr/get-started"
    [languages.fr.params.cta.secondary_button]
      text = "Démo"
      url = "/fr/demo"

  # Footer Configuration (IMPORTANT - Required for footer to display correctly)
  [languages.fr.params.footer]
    column_1_title = "FONCTIONNALITÉS"
    column_2_title = "ENTREPRISE"
    column_3_title = "LÉGAL"

  # Header Configuration
  [languages.fr.params.header]
    [languages.fr.params.header.buttons]
      [languages.fr.params.header.buttons.signIn]
        text = "Connexion"
        url = "/fr/signin"
      [languages.fr.params.header.buttons.getStarted]
        text = "Commencer"
        url = "/fr/get-started"

  # Blog configuration
  [languages.fr.params.blog]
    enable = true
    title = "Derniers Articles"
    subtitle = "Apprenez-en plus sur le développement web et les meilleures pratiques"
```

**Important Notes:**
- **Footer Configuration:** The `footer` section is required. Without it, footer column titles may not display correctly in the new language.
- **Use uppercase** for footer column titles to maintain consistency with other languages
- **URL paths:** Include the language prefix (e.g., `/fr/`) in all button URLs
- All parameters should mirror the structure used in other languages (check English or Chinese examples)

### 6. Complete Checklist

Use this checklist to ensure you've configured everything correctly:

- [ ] **Language Config:** Added language configuration in `hugo.toml` with `languageCode`, `languageName`, `title`, `weight`, and `contentDir`
- [ ] **Translation File:** Created `i18n/[lang].toml` with all UI translations (50+ keys)
- [ ] **Content Directory:** Created `content/[lang]/` directory structure
- [ ] **Homepage:** Created `content/[lang]/_index.md` with translated homepage content
- [ ] **Navigation Menus:** Configured `languages.[lang].menu.main`, `footer_column_1`, `footer_column_2`, `footer_column_3`
- [ ] **Language Params - CTA:** Added `languages.[lang].params.cta` configuration
- [ ] **Language Params - Footer:** Added `languages.[lang].params.footer` with all three column titles (UPPERCASE)
- [ ] **Language Params - Header:** Added `languages.[lang].params.header.buttons` configuration
- [ ] **Language Params - Blog:** Added `languages.[lang].params.blog` configuration
- [ ] **URL Prefixes:** All menu URLs include the language prefix (e.g., `/fr/features`)
- [ ] **Test:** Verified language switcher appears in header with new language
- [ ] **Test:** Verified homepage displays correctly in new language
- [ ] **Test:** Verified top navigation menu shows translated items
- [ ] **Test:** Verified footer navigation shows translated items
- [ ] **Test:** Verified footer column titles display in new language

### Common Mistakes to Avoid

1. **Missing Footer Config:** Forgetting to add `languages.[lang].params.footer` will cause footer titles to not display
2. **Inconsistent Capitalization:** Footer column titles should be UPPERCASE to match the theme's style
3. **Missing URL Prefixes:** All language-specific URLs must include the language code (e.g., `/fr/`, not just `/`)
4. **Incomplete Menus:** Ensure all three footer menus (`footer_column_1`, `footer_column_2`, `footer_column_3`) are configured
5. **Missing i18n Keys:** Make sure all 50+ translation keys are present in your translation file

## Best Practices

1. **Consistent Structure:** Mirror your content directory structure across all languages
2. **Translation Keys:** Use descriptive i18n keys like `readMore` instead of abbreviations
3. **Avoid Hardcoding:** Don't set text parameters in global config; let i18n handle it
4. **Test Switching:** Verify language switching works correctly on all pages
5. **Date Formats:** Define appropriate date formats for each language
6. **Menus:** Configure language-specific menus with translated labels
7. **URLs:** Include language code in URLs for non-default languages

## Resources

- **Hugo i18n Documentation:** https://gohugo.io/content-management/multilingual/
- **Theme i18n Files:** `themes/hugo-saasify-theme/i18n/`
- **Demo Site Configuration:** See complete trilingual setup in demo site's `hugo.toml`
- **Translation Examples:**
  - English: `i18n/en.toml` (reference for all keys)
  - Chinese: `i18n/zh-cn.toml` (complete translation)
  - German: `i18n/de.toml` (complete translation)
- **Content Structure Examples:**
  - `content/` (English)
  - `content/zh-cn/` (Chinese)
  - `content/de/` (German)

## Support

For issues or questions about i18n:
1. Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. Review the demo site's working multilingual setup
3. Open an issue on GitHub with details about your configuration
