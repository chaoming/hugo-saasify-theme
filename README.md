# Hugo Saasify Theme

A modern and elegant Hugo theme specifically designed for SaaS websites. Built with TailwindCSS, this theme provides a clean, professional look while maintaining excellent performance and customization options.

![Hugo Saasify Theme Screenshot](https://raw.githubusercontent.com/chaoming/hugo-saasify-theme/main/screenshots/screenshot1.png)

![Hugo Saasify Theme Screenshot 2](https://raw.githubusercontent.com/chaoming/hugo-saasify-theme/main/screenshots/screenshot2.png)

![Hugo Saasify Theme Screenshot 3](https://raw.githubusercontent.com/chaoming/hugo-saasify-theme/main/screenshots/screenshot3.png)

[Demo Site](https://saasify-demo.chaoming.li)

## Features

- 🎨 Modern design with TailwindCSS
- 📱 Fully responsive layout
- 🚀 Performance optimized
- 💅 Clean typography with Inter & Plus Jakarta Sans fonts
- 🎯 Perfect for SaaS and business websites
- 🛠 Easy to customize
- 📦 No jQuery, minimal JavaScript
- 📊 Google Analytics support
- 📈 Google Tag Manager support
- 🔧 Custom head content support for additional tracking scripts
- 🎪 21 pre-built shortcodes for rapid page building
- 📚 Documentation layout with automatic sidebar navigation
- 🌍 Built-in multilingual support with automatic language switcher

## Documentation

**📖 [Complete Documentation →](docs/README.md)**

Comprehensive guides covering everything you need:

- **[Installation Guide](docs/INSTALLATION.md)** - Get started quickly
- **[Configuration Guide](docs/CONFIGURATION.md)** - All configuration options
- **[Layouts Guide](docs/LAYOUTS.md)** - Understanding layouts and templates
- **[Shortcodes Reference](docs/SHORTCODES.md)** - All 21 shortcodes documented
- **[Styling Guide](docs/STYLING.md)** - Customize colors, fonts, and styles
- **[Content Creation Guide](docs/CONTENT-CREATION.md)** - Create pages and blog posts
- **[Deployment Guide](docs/DEPLOYMENT.md)** - Deploy to various platforms
- **[Troubleshooting Guide](docs/TROUBLESHOOTING.md)** - Common issues and solutions

## Requirements

- Hugo Extended Version (>= 0.80.0)
- Node.js (>= 14.x)
- npm or yarn

## Installation

### 1. Create a new Hugo site (skip if you have an existing site)

```bash
hugo new site your-site-name
cd your-site-name
```

### 2. Add the theme as a submodule

```bash
git init
git submodule add https://github.com/chaoming/hugo-saasify-theme themes/hugo-saasify-theme
```

### 3. Example Site (Optional)

The theme comes with a fully functional example site that demonstrates its features and capabilities. You can use this as a reference when building your own site.

### Using the Example Site

The example site provides a great starting point to understand how to:
- Structure your content
- Use different page layouts
- Configure navigation menus
- Set up site parameters
- Implement common SaaS website features

1. Copy the example site content:
```bash
cp -r themes/hugo-saasify-theme/exampleSite/* .
```

2. The example site includes:
- Complete content structure with sample pages
- Blog posts with various layouts
- Feature pages
- Career/Jobs section
- Pricing page
- Company information page
- Properly configured hugo.toml

### 4. Install dependencies

```bash
# Copy package.json and other config files to your site root
cp themes/hugo-saasify-theme/package.json .
cp themes/hugo-saasify-theme/postcss.config.js .
cp themes/hugo-saasify-theme/tailwind.config.copy.js ./tailwind.config.js
```

```bash
# Install dependencies
npm install
```

### 5. Configure your Hugo site

Create or update your `hugo.toml` with the following configuration:

```toml
# Basic Configuration
baseURL = "/"
languageCode = "en-us"
title = "Your Site Title"
theme = "hugo-saasify-theme"

# Required Features
pygmentsCodeFences = true  # Enable syntax highlighting
pygmentsUseClasses = true
enableEmoji = true        # Enable emoji support
enableGitInfo = true      # Enable Git info for lastmod

# Required Module Configuration
[module]
  [module.hugoVersion]
    extended = true
    min = "0.80.0"

# Required Build Configuration
[build]
  writeStats = true      # Required for TailwindCSS

# Required Markup Configuration
[markup]
  [markup.highlight]
    noClasses = false
    lineNos = true
    codeFences = true
  [markup.goldmark.renderer]
    unsafe = true       # Allow HTML in markdown
  [markup.tableOfContents]
    endLevel = 3
    ordered = false
    startLevel = 2

# Theme Parameters
[params]
  description = "Your site description"
  author = "Your Name"
  logo = "/images/logo.svg"      # Path to your logo
  # Google Analytics ID (e.g., "G-XXXXXXXXXX")
  googleAnalytics = "G-XXXXXXXXXX"  # Only enabled in production

  # Google Tag Manager ID (e.g., "GTM-XXXXXXX")
  # Only enabled in production
  googleTagManager = "GTM-XXXXXXX"

  # Header Configuration
  [params.header]
    background = "bg-white/80 backdrop-blur-sm"
    border = "border-b border-gray-100"
    
    # Header Logo
    [params.header.logo]
      src = "/images/logo.svg"
    
    # Header Buttons (optional)
    [params.header.buttons]
      [params.header.buttons.signIn]
        text = "Sign in"
        url = "/signin"
      [params.header.buttons.getStarted]
        text = "Get Started"
        url = "/get-started"

  # Global CTA Configuration (optional)
  [params.cta]
    enable = true
    title = "Ready to Get Started?"
    description = "Join companies using our platform"
    [params.cta.primary_button]
      text = "Get Started Free"
      url = "/get-started"
    [params.cta.secondary_button]
      text = "Book Demo"
      url = "/demo"

  # Social Media Links (optional)
  [params.social]
    linkedin = "https://linkedin.com/in/yourusername"
    twitter = "https://twitter.com/yourusername"
    bluesky = "https://bsky.app/profile/yourblueskyhandle"
    github = "https://github.com/yourusername"

# Navigation Menu
[menu]
  [[menu.main]]
    name = "Features"
    weight = 1
    [menu.main.params]
      has_submenu = true
      submenu = [
        { name = "Feature 1", url = "/features/feature-1/" },
        { name = "Feature 2", url = "/features/feature-2/" }
      ]
  [[menu.main]]
    name = "Pricing"
    url = "/pricing"
    weight = 2
  [[menu.main]]
    name = "Blog"
    url = "/blog"
    weight = 3
```

This configuration includes:

- **Basic Settings**: Site title, language, and theme selection
- **Required Features**: Syntax highlighting, emoji support, and Git integration
- **Module Configuration**: Hugo version requirements
- **Build Settings**: Required for TailwindCSS integration
- **Markup Settings**: Code highlighting and markdown rendering options
- **Theme Parameters**: 
  - Header configuration with logo and navigation
  - Call-to-action (CTA) sections
  - Social media links
  - Google Analytics configuration (only enabled in production)
  - Google Tag Manager configuration (only enabled in production)
  - Custom head content for additional tracking scripts and meta tags
- **Navigation Menu**: Main menu structure with dropdown support

## Development

To start the development server with live reload:

```bash
npm run start
```

This will:
- Watch for changes in your TailwindCSS styles
- Run the Hugo development server
- Automatically rebuild when changes are detected

To build your site for production:

```bash
npm run build
```

This will:
- Build and minify your TailwindCSS styles
- Generate minified Hugo site in the `public` directory

## Customization

### Colors

The theme uses a primary and secondary color scheme that can be customized in `tailwind.config.js`:

```js
colors: {
  primary: {
    // Your primary color palette
  },
  secondary: {
    // Your secondary color palette
  }
}
```

### Typography

The theme uses Inter for body text and Plus Jakarta Sans for headings. You can modify this in `tailwind.config.js`:

```js
fontFamily: {
  sans: ['Inter', 'system-ui', 'sans-serif'],
  heading: ['Plus Jakarta Sans', 'sans-serif'],
}
```

### Layout Components

Common components like buttons, cards, and sections can be customized in `assets/css/main.css`.

### Custom Head Content

Add custom tracking scripts or meta tags by creating `layouts/partials/custom-head.html` in your site:

```html
<!-- layouts/partials/custom-head.html -->
<!-- Example: Adding Hotjar tracking -->
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

<!-- Example: Site verification -->
<meta name="google-site-verification" content="your-code" />
```

This is perfect for:
- Third-party analytics (Hotjar, Mixpanel, Heap, etc.)
- Site verification meta tags
- Custom fonts or stylesheets
- A/B testing scripts
- Chat widgets

See the [Configuration Guide](docs/CONFIGURATION.md#custom-head-content) for more details.

## Content Structure

```
content/
├── _index.md          # Homepage content
├── blog/              # Blog posts
├── features/          # Feature pages
└── docs/              # Documentation pages
```

## License

This theme is released under the [MIT license](https://github.com/chaoming/hugo-saasify-theme/blob/main/LICENSE).

## Quick Links

- 📖 [Documentation](docs/README.md)
- 🎨 [Demo Site](https://saasify-demo.chaoming.li)
- 🐛 [Report Issues](https://github.com/chaoming/hugo-saasify-theme/issues)
- 💬 [Discussions](https://github.com/chaoming/hugo-saasify-theme/discussions)

## Support

Need help? Check the documentation first:

1. **[Complete Documentation](docs/README.md)** - Start here
2. **[Troubleshooting Guide](docs/TROUBLESHOOTING.md)** - Common issues
3. **[GitHub Issues](https://github.com/chaoming/hugo-saasify-theme/issues)** - Report bugs or request features

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author

Created by [Chaoming Li](https://chaoming.li)
