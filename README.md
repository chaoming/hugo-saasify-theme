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
baseURL = "/"                     # Placeholder for site URL
languageCode = "en-us"
title = "Your Site Title"        # Placeholder for site name
theme = "hugo-saasify-theme"

# Syntax highlighting & features
pygmentsCodeFences = true
pygmentsUseClasses = true
enableEmoji = true
enableGitInfo = true

# Taxonomies
[taxonomies]
  category = "categories"
  tag = "tags"

# Pagination
paginate = 6
paginatePath = "page"

# Theme Parameters
[params]
  description = "Your site description"
  author = "Your Name"
  logo = "/images/logo.svg"
  googleAnalytics = "G-XXXXXXXXXX"  # Placeholder for GA ID

  # Global CTA
  [params.cta]
    enable = true
    title = "Ready to Get Started?"
    description = "Join companies using our platform"
    gradient_from = "#2563eb"
    gradient_to = "#7c3aed"
    gradient_angle = 30
    [params.cta.primary_button]
      text = "Get Started Free"
      url = "/get-started"
    [params.cta.secondary_button]
      text = "Book Demo"
      url = "/demo"

  # Social Links (placeholders)
  [params.social]
    linkedin = "https://linkedin.com/in/yourusername"
    twitter = "https://twitter.com/yourusername"
    github = "https://github.com/yourusername"

  # Header Config
  [params.header]
    background = "bg-white/80 backdrop-blur-sm"
    border = "border-b border-gray-100"

    [params.header.logo]
      src = "/images/logo.svg"

    [params.header.menu]
      spacing = "space-x-8"

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

    [params.header.buttons]
      [params.header.buttons.signIn]
        text = "Sign in"
        url = "/signin"
      [params.header.buttons.getStarted]
        text = "Get Started"
        url = "/get-started"

  # Blog Config
  [params.blog]
    enable = true
    title = "Latest Articles"
    subtitle = "Learn more about web development and best practices"

    [params.blog.cta]
      enable = true

    [params.blog.sidebar.recent]
      enable = true
      title = "Recent Articles"
      count = 5

    [params.blog.sidebar.categories]
      enable = true
      title = "Categories"

    [params.blog.sidebar.tags]
      enable = true
      title = "Popular Tags"
      count = 20

    [params.blog.sidebar.subscribe]
      enable = true
      title = "Subscribe to Newsletter"
      description = "Get the latest posts delivered right to your inbox"
      action = "https://formspree.io/f/your-form-id"
      emailName = "email"
      buttonText = "Subscribe"
      placeholder = "Enter your email"
      disclaimer = "We respect your privacy. Unsubscribe at any time."

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

# Footer Menus (optional)
[[menu.footer_column_1]]
  name = "Feature 1"
  url = "/features/feature-1/"
  weight = 1
[[menu.footer_column_1]]
  name = "Feature 2"
  url = "/features/feature-2/"
  weight = 2

[[menu.footer_column_2]]
  name = "Blog"
  url = "/blog"
  weight = 1
[[menu.footer_column_2]]
  name = "About Us"
  url = "/company"
  weight = 2
[[menu.footer_column_2]]
  name = "Careers"
  url = "/careers"
  weight = 3

[[menu.footer_column_3]]
  name = "License"
  url = "/license"
  weight = 1
[[menu.footer_column_3]]
  name = "Privacy Policy"
  url = "/privacy"
  weight = 2

# Module Config
[module]
  [module.hugoVersion]
    extended = true
    min = "0.80.0"

# Build Config
[build]
  writeStats = true
  [build.buildStats]
    enable = true

# Security Settings
[security.funcs]
  getenv = ['^HUGO_', '^CI$']

# Markup Config
[markup]
  [markup.highlight]
    noClasses = false
    lineNos = true
    codeFences = true
    guessSyntax = true
    lineNumbersInTable = true

  [markup.goldmark.renderer]
    unsafe = true

  [markup.tableOfContents]
    endLevel = 3
    ordered = false
    startLevel = 2
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

## Support

If you have any questions or need help, please [open an issue](https://github.com/chaoming/hugo-saasify-theme/issues).
