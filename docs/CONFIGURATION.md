# Configuration Guide

Complete reference for configuring the Hugo Saasify Theme. This guide covers all available configuration options in your `hugo.toml` file.

## Table of Contents

- [Basic Configuration](#basic-configuration)
- [Site Parameters](#site-parameters)
- [Header Configuration](#header-configuration)
- [Footer Configuration](#footer-configuration)
- [CTA Configuration](#cta-configuration)
- [Blog Configuration](#blog-configuration)
- [Social Media Links](#social-media-links)
- [Analytics Configuration](#analytics-configuration)
- [Menu Configuration](#menu-configuration)
- [Build Settings](#build-settings)
- [Markup Configuration](#markup-configuration)
- [Taxonomy Configuration](#taxonomy-configuration)
- [Advanced Options](#advanced-options)

## Basic Configuration

Essential settings that every site needs.

```toml
baseURL = "https://your-domain.com/"
languageCode = "en-us"
title = "Your SaaS Name"
theme = "hugo-saasify-theme"

# Enable syntax highlighting
pygmentsCodeFences = true
pygmentsUseClasses = true

# Enable emoji support
enableEmoji = true

# Enable Git info for lastmod dates
enableGitInfo = true

# Pagination
paginate = 6
paginatePath = "page"
```

### Configuration Options

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `baseURL` | string | Your site's production URL | Required |
| `languageCode` | string | Site language code (ISO 639-1) | `en-us` |
| `title` | string | Site title (appears in browser, meta) | Required |
| `theme` | string | Must be "hugo-saasify-theme" | Required |
| `pygmentsCodeFences` | boolean | Enable syntax highlighting in code blocks | `true` |
| `pygmentsUseClasses` | boolean | Use CSS classes for syntax highlighting | `true` |
| `enableEmoji` | boolean | Enable emoji shortcodes in content | `true` |
| `enableGitInfo` | boolean | Use Git commit dates for lastmod | `false` |
| `paginate` | integer | Number of posts per page in lists | `6` |
| `paginatePath` | string | URL path component for pagination | `page` |

## Site Parameters

Global parameters available throughout your site.

```toml
[params]
  description = "Modern SaaS platform for your business needs"
  author = "Your Company Name"
  logo = "/images/logo.svg"

  # Google Analytics (GA4)
  googleAnalytics = "G-XXXXXXXXXX"

  # Google Tag Manager
  googleTagManager = "GTM-XXXXXXX"

  # Favicon
  favicon = "/images/favicon.ico"

  # Default OG Image
  ogImage = "/images/og-image.jpg"

  # Copyright text
  copyright = "© 2025 Your Company. All rights reserved."
```

### Parameter Descriptions

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `description` | string | Default meta description | Recommended |
| `author` | string | Site author/company name | Optional |
| `logo` | string | Path to logo image | Recommended |
| `googleAnalytics` | string | Google Analytics 4 ID | Optional |
| `googleTagManager` | string | Google Tag Manager ID | Optional |
| `favicon` | string | Path to favicon | Optional |
| `ogImage` | string | Default Open Graph image | Optional |
| `copyright` | string | Footer copyright text | Optional |

## Header Configuration

Customize your site's header, navigation, and menu appearance.

```toml
[params.header]
  # Header styles
  background = "bg-white/80 backdrop-blur-sm"
  border = "border-b border-gray-100"

  # Logo configuration
  [params.header.logo]
    src = "/images/logo.svg"
    alt = "Company Logo"
    width = "auto"
    height = "40"

  # Menu configuration
  [params.header.menu]
    spacing = "space-x-8"
    font_size = "text-sm"
    font_weight = "font-medium"

    # Dropdown menu styling
    [params.header.menu.dropdown]
      width = "w-72"
      container_padding = "py-6"
      item_padding = "px-8 py-3"
      background = "bg-white"
      border = "border border-gray-100"
      shadow = "shadow-xl"
      radius = "rounded-lg"
      text_color = "text-gray-700"
      hover_background = "hover:bg-gray-50"
      text_size = "text-sm"

  # Header buttons
  [params.header.buttons]
    # Sign In button
    [params.header.buttons.signIn]
      text = "Sign in"
      url = "/signin"
      style = "text-gray-600 hover:text-primary-600"

    # Get Started button
    [params.header.buttons.getStarted]
      text = "Get Started"
      url = "/get-started"
      style = "btn-primary"
```

### Header Options

**Background and Border**
- `background`: Tailwind classes for header background
- `border`: Tailwind classes for header border

**Logo Settings**
- `src`: Path to logo image file
- `alt`: Alternative text for logo
- `width`: Logo width (CSS value)
- `height`: Logo height (CSS value)

**Menu Styling**
- `spacing`: Horizontal spacing between menu items
- `font_size`: Text size for menu items
- `font_weight`: Font weight for menu items

**Dropdown Customization**
- All properties accept Tailwind CSS classes
- Customize width, padding, colors, shadows, etc.

## Footer Configuration

Configure footer columns and layout.

```toml
[params.footer]
  # Column titles
  column_1_title = "Product"
  column_2_title = "Company"
  column_3_title = "Legal"

  # Footer text
  description = "Building amazing SaaS products since 2024"

  # Show social icons
  show_social = true

  # Newsletter subscription
  [params.footer.newsletter]
    enable = true
    title = "Subscribe to our newsletter"
    description = "Get the latest updates and news"
    action = "https://formspree.io/f/your-form-id"
    placeholder = "Enter your email"
    button_text = "Subscribe"
```

### Footer Menus

Footer menus are configured in the `[menu]` section. See [Menu Configuration](#menu-configuration).

## CTA Configuration

Global Call-to-Action section that appears on various pages.

```toml
[params.cta]
  enable = true
  title = "Ready to Get Started?"
  description = "Join thousands of companies using our platform"

  # Gradient background
  gradient_from = "#2563eb"  # Blue-600
  gradient_to = "#7c3aed"    # Purple-600
  gradient_angle = 30

  # Primary button
  [params.cta.primary_button]
    text = "Start Free Trial"
    url = "/signup"

  # Secondary button
  [params.cta.secondary_button]
    text = "Schedule Demo"
    url = "/demo"
```

### CTA Options

| Parameter | Type | Description |
|-----------|------|-------------|
| `enable` | boolean | Show/hide global CTA |
| `title` | string | CTA heading text |
| `description` | string | CTA description text |
| `gradient_from` | string | Gradient start color (hex) |
| `gradient_to` | string | Gradient end color (hex) |
| `gradient_angle` | integer | Gradient angle in degrees |
| `primary_button.text` | string | Primary button label |
| `primary_button.url` | string | Primary button link |
| `secondary_button.text` | string | Secondary button label |
| `secondary_button.url` | string | Secondary button link |

## Blog Configuration

Configure blog functionality and sidebar options.

```toml
[params.blog]
  enable = true
  title = "Latest Articles"
  subtitle = "Insights, tutorials, and updates"

  # Show estimated reading time
  show_reading_time = true

  # Show author info
  show_author = true

  # Show post date
  show_date = true

  # Date format (Go time format)
  date_format = "January 2, 2006"

  # CTA in blog posts
  [params.blog.cta]
    enable = true

  # Sidebar configuration
  [params.blog.sidebar]
    # Recent articles
    [params.blog.sidebar.recent]
      enable = true
      title = "Recent Articles"
      count = 5

    # Categories
    [params.blog.sidebar.categories]
      enable = true
      title = "Categories"
      show_count = true

    # Tags
    [params.blog.sidebar.tags]
      enable = true
      title = "Popular Tags"
      count = 20
      style = "cloud"  # "cloud" or "list"

    # Newsletter subscription
    [params.blog.sidebar.subscribe]
      enable = true
      title = "Subscribe to Newsletter"
      description = "Get the latest posts delivered to your inbox"
      action = "https://formspree.io/f/your-form-id"
      emailName = "email"
      buttonText = "Subscribe"
      placeholder = "Enter your email"
      disclaimer = "We respect your privacy. Unsubscribe anytime."
```

### Blog Display Options

**Post Metadata**
- `show_reading_time`: Display estimated reading time
- `show_author`: Show author name
- `show_date`: Display publication date
- `date_format`: Date format string (Go format)

**Sidebar Widgets**
- Each widget can be enabled/disabled individually
- Customize titles and display counts
- Tags can be displayed as cloud or list

## Social Media Links

Configure social media profiles for footer and sharing.

```toml
[params.social]
  linkedin = "https://linkedin.com/company/yourcompany"
  twitter = "https://twitter.com/yourhandle"
  bluesky = "https://bsky.app/profile/yourhandle"
  youtube = "https://youtube.com/@yourchannel"
  facebook = "https://facebook.com/yourpage"
  instagram = "https://instagram.com/yourhandle"
  github = "https://github.com/yourorg"
  telegram = "https://t.me/yourchannel"
  discord = "https://discord.gg/yourinvite"
  slack = "https://yourteam.slack.com"
  medium = "https://medium.com/@yourhandle"
  dribbble = "https://dribbble.com/yourprofile"
  behance = "https://behance.net/yourprofile"
```

Add only the social networks you want to display. Omit the others.

## Analytics Configuration

### Google Analytics 4

```toml
[params]
  # Google Analytics 4 (GA4)
  googleAnalytics = "G-XXXXXXXXXX"
```

The theme includes automatic GA4 integration. Simply add your measurement ID.

**Features**:
- Page view tracking
- Event tracking
- User engagement metrics
- Automatic configuration

### Google Tag Manager

```toml
[params]
  # Google Tag Manager
  googleTagManager = "GTM-XXXXXXX"
```

GTM provides more advanced tracking capabilities.

**Features**:
- Custom event tracking
- Enhanced e-commerce
- Multiple tag management
- Advanced triggers and variables

**Implementation**:
- Head script automatically inserted
- Body script (noscript) included
- Compatible with GA4

### Using Both Analytics Tools

You can use both GA4 and GTM simultaneously:

```toml
[params]
  googleAnalytics = "G-XXXXXXXXXX"
  googleTagManager = "GTM-XXXXXXX"
```

**Best Practice**: If using GTM, configure GA4 through GTM rather than directly for better control.

### Custom Head Content

For tracking scripts and tools not covered by Google Analytics or Google Tag Manager, you can add custom code to the `<head>` section.

**How to use**:

1. Create a file in your site: `layouts/partials/custom-head.html`
2. Add any custom HTML, scripts, or meta tags to this file

**Example** - Adding Hotjar tracking:

```html
<!-- layouts/partials/custom-head.html -->
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:YOUR_HOTJAR_ID,hjsv:6};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
</script>
```

**Example** - Adding site verification meta tags:

```html
<!-- layouts/partials/custom-head.html -->
<meta name="google-site-verification" content="your-verification-code" />
<meta name="pinterest-site-verification" content="your-verification-code" />
```

**Example** - Adding custom fonts:

```html
<!-- layouts/partials/custom-head.html -->
<link rel="preconnect" href="https://fonts.bunny.net">
<link href="https://fonts.bunny.net/css?family=figtree:400,600" rel="stylesheet" />
```

**Use Cases**:
- Third-party tracking scripts (Hotjar, Mixpanel, Heap, etc.)
- Site verification meta tags
- Custom fonts or stylesheets
- A/B testing scripts
- Chat widget scripts
- Any other code that needs to be in the `<head>` section

**Note**: The `custom-head.html` partial is loaded after all other head elements, giving you full control while maintaining theme compatibility.

## Menu Configuration

Configure navigation menus for header and footer.

### Main Navigation Menu

```toml
[menu]
  # Simple menu item
  [[menu.main]]
    name = "Pricing"
    url = "/pricing"
    weight = 2

  # Menu item with dropdown
  [[menu.main]]
    name = "Features"
    weight = 1
    [menu.main.params]
      has_submenu = true
      submenu = [
        { name = "Performance", url = "/features/performance/" },
        { name = "Design System", url = "/features/design/" },
        { name = "Developer Experience", url = "/features/dx/" }
      ]

  # External link
  [[menu.main]]
    name = "Documentation"
    url = "https://docs.example.com"
    weight = 5
    [menu.main.params]
      external = true
```

### Footer Menus

```toml
[menu]
  # Footer Column 1
  [[menu.footer_column_1]]
    name = "Features"
    url = "/features"
    weight = 1

  [[menu.footer_column_1]]
    name = "Pricing"
    url = "/pricing"
    weight = 2

  # Footer Column 2
  [[menu.footer_column_2]]
    name = "About Us"
    url = "/about"
    weight = 1

  [[menu.footer_column_2]]
    name = "Blog"
    url = "/blog"
    weight = 2

  # Footer Column 3
  [[menu.footer_column_3]]
    name = "Privacy Policy"
    url = "/privacy"
    weight = 1

  [[menu.footer_column_3]]
    name = "Terms of Service"
    url = "/terms"
    weight = 2
```

### Menu Parameters

**Standard Parameters**
- `name`: Display text
- `url`: Link destination
- `weight`: Sort order (lower = earlier)

**Custom Parameters**
- `has_submenu`: Enable dropdown menu
- `submenu`: Array of submenu items
- `external`: Mark as external link

## Build Settings

Essential build configuration for the theme.

```toml
[module]
  [module.hugoVersion]
    extended = true
    min = "0.80.0"

[build]
  writeStats = true

[build.buildStats]
  enable = true

[security.funcs]
  getenv = ['^HUGO_', '^CI$']
```

### Build Options

| Parameter | Description |
|-----------|-------------|
| `module.hugoVersion.extended` | Require Hugo Extended (needed for Tailwind) |
| `module.hugoVersion.min` | Minimum Hugo version |
| `build.writeStats` | Generate build statistics for Tailwind |
| `build.buildStats.enable` | Enable detailed build stats |
| `security.funcs.getenv` | Allowed environment variable patterns |

**Important**: These settings are required for the theme to work correctly.

## Markup Configuration

Configure content rendering and syntax highlighting.

```toml
[markup]
  # Syntax highlighting
  [markup.highlight]
    noClasses = false        # Use CSS classes
    lineNos = true           # Show line numbers
    codeFences = true        # Enable fenced code blocks
    guessSyntax = true       # Auto-detect language
    lineNumbersInTable = true # Line numbers in table format
    style = "monokai"        # Syntax highlighting theme

  # Goldmark (Markdown renderer)
  [markup.goldmark.renderer]
    unsafe = true            # Allow raw HTML in markdown

  # Table of Contents
  [markup.tableOfContents]
    endLevel = 3             # Deepest heading level
    ordered = false          # Use unordered lists
    startLevel = 2           # Starting heading level
```

### Syntax Highlighting

**Available Styles**:
- `monokai` (default, dark theme)
- `github`
- `dracula`
- `vim`
- `nord`
- And many more from [Chroma Gallery](https://xyproto.github.io/splash/docs/)

**Line Numbers**:
- `lineNos`: Enable/disable line numbers
- `lineNumbersInTable`: Use table format for better copy/paste

### Table of Contents

- `startLevel`: First heading level to include (2 = h2)
- `endLevel`: Last heading level to include (3 = h3)
- `ordered`: Use ordered (`<ol>`) or unordered (`<ul>`) lists

## Taxonomy Configuration

Configure categories, tags, and other taxonomies.

```toml
[taxonomies]
  category = 'categories'
  tag = 'tags'
  author = 'authors'
  series = 'series'
```

### Default Taxonomies

The theme supports standard taxonomies:
- **Categories**: Broad content groupings
- **Tags**: Specific keywords and topics

### Custom Taxonomies

Add custom taxonomies as needed:

```toml
[taxonomies]
  category = 'categories'
  tag = 'tags'
  author = 'authors'      # Group by author
  series = 'series'       # Group by series
  product = 'products'    # Custom: group by product
```

Use in content front matter:

```yaml
---
title: "My Post"
categories: ["Technology"]
tags: ["Hugo", "Web Development"]
authors: ["John Doe"]
series: ["Getting Started"]
products: ["Product A"]
---
```

## Advanced Options

### Custom CSS

Add custom CSS files:

```toml
[params]
  customCSS = ["css/custom.css", "css/overrides.css"]
```

Place files in `static/css/` directory.

### Custom JavaScript

Add custom JavaScript files:

```toml
[params]
  customJS = ["js/custom.js", "js/analytics.js"]
```

Place files in `static/js/` directory.

### Language Configuration

The theme includes a built-in language switcher that automatically appears in the header when multiple languages are configured.

For multilingual sites:

```toml
defaultContentLanguage = "en"
defaultContentLanguageInSubdir = false

[languages]
  [languages.en]
    languageCode = "en-us"
    languageName = "English"
    weight = 1
    [languages.en.params]
      description = "English description"

  [languages.es]
    languageCode = "es"
    languageName = "Español"
    weight = 2
    [languages.es.params]
      description = "Descripción en español"
  
  [languages.fr]
    languageCode = "fr"
    languageName = "Français"
    weight = 3
    [languages.fr.params]
      description = "Description en français"
```

#### Language Switcher

When multiple languages are configured:
- A language switcher dropdown automatically appears in the header navigation (both desktop and mobile)
- The switcher shows the current language with a globe icon
- Users can click to see available languages and switch between them
- The switcher intelligently links to translated pages when available, or the homepage for untranslated content

The language switcher only displays when `[languages]` is configured with at least 2 languages. For single-language sites, it remains hidden.

### Output Formats

Configure additional output formats:

```toml
[outputs]
  home = ["HTML", "RSS", "JSON"]
  section = ["HTML", "RSS"]
```

### Privacy Settings

Configure privacy-related features:

```toml
[privacy]
  [privacy.googleAnalytics]
    anonymizeIP = true
    respectDoNotTrack = true

  [privacy.youtube]
    privacyEnhanced = true
```

## Environment Variables

Use environment variables for sensitive data:

```toml
[params]
  googleAnalytics = "${HUGO_GOOGLE_ANALYTICS}"
  googleTagManager = "${HUGO_GOOGLE_TAG_MANAGER}"
```

Set variables before building:

```bash
export HUGO_GOOGLE_ANALYTICS="G-XXXXXXXXXX"
export HUGO_GOOGLE_TAG_MANAGER="GTM-XXXXXXX"
hugo
```

## Configuration Best Practices

1. **Version Control**: Never commit sensitive data (API keys) to Git
2. **Environment Variables**: Use for deployment-specific values
3. **Comments**: Document custom configuration choices
4. **Validation**: Test configuration changes locally before deploying
5. **Backups**: Keep backups of working configurations
6. **Organization**: Group related settings together
7. **Defaults**: Only override defaults when necessary

## Example Complete Configuration

See the theme's `exampleSite/hugo.toml` for a complete, working configuration example.

```bash
# View example configuration
cat themes/hugo-saasify-theme/exampleSite/hugo.toml
```

## Configuration Migration

### From YAML to TOML

If you have a `config.yaml`, convert to TOML:

```bash
# Using yj tool
cat config.yaml | yj -yt > hugo.toml
```

### From config.toml to hugo.toml

Hugo 0.110+ uses `hugo.toml` instead of `config.toml`:

```bash
# Simply rename the file
mv config.toml hugo.toml
```

## Related Documentation

- [INSTALLATION.md](INSTALLATION.md) - Theme installation
- [LAYOUTS.md](LAYOUTS.md) - Available layouts
- [CONTENT-CREATION.md](CONTENT-CREATION.md) - Creating content
- [STYLING.md](STYLING.md) - Customizing appearance
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common issues

## Need Help?

If you're having configuration issues:

1. Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. Review the [example configuration](../exampleSite/hugo.toml)
3. Visit [GitHub Issues](https://github.com/chaoming/hugo-saasify-theme/issues)
4. Consult [Hugo Documentation](https://gohugo.io/documentation/)
