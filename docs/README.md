# Hugo Saasify Theme Documentation

Welcome to the complete documentation for Hugo Saasify Theme - a modern, high-performance Hugo theme built specifically for SaaS websites.

## 📚 Documentation Overview

This documentation is organized into focused guides to help you get started quickly and master every aspect of the theme.

### Getting Started

Start here if you're new to the theme:

1. **[Installation Guide](INSTALLATION.md)** - Set up the theme and its dependencies
2. **[Configuration Guide](CONFIGURATION.md)** - Configure your site settings
3. **[Content Creation Guide](CONTENT-CREATION.md)** - Create pages and blog posts

### Core Concepts

Learn about the theme's architecture and features:

4. **[Layouts Guide](LAYOUTS.md)** - Understanding layout templates and structure
5. **[Shortcodes Reference](SHORTCODES.md)** - Complete guide to all 21 shortcodes
6. **[Styling Guide](STYLING.md)** - TailwindCSS configuration and customization
7. **[Multilingual Guide](MULTILINGUAL.md)** - Set up multilingual sites with language switcher

### Deployment & Production

Ready to go live?

8. **[Deployment Guide](DEPLOYMENT.md)** - Deploy to Netlify, Vercel, GitHub Pages, and more
9. **[Troubleshooting Guide](TROUBLESHOOTING.md)** - Common issues and solutions

## 🚀 Quick Start

Get your site running in 5 minutes:

```bash
# 1. Create new Hugo site
hugo new site my-saas-site
cd my-saas-site

# 2. Add theme as submodule
git init
git submodule add https://github.com/chaoming/hugo-saasify-theme themes/hugo-saasify-theme

# 3. Copy example site
cp -r themes/hugo-saasify-theme/exampleSite/* .

# 4. Install dependencies
npm install

# 5. Start development server
npm run start
```

Visit `http://localhost:1313` to see your site!

## 📖 Documentation Guides

### [Installation Guide](INSTALLATION.md)

Learn how to install and set up the Hugo Saasify Theme:

- System requirements (Hugo Extended, Node.js)
- Installation methods (new site vs. existing site)
- Configuration setup
- Troubleshooting installation issues
- Updating the theme

**Start here if:** You're installing the theme for the first time.

---

### [Configuration Guide](CONFIGURATION.md)

Complete reference for all configuration options:

- Basic site configuration
- Header and footer customization
- Call-to-action (CTA) settings
- Blog configuration
- Social media links
- Google Analytics and Tag Manager
- Menu configuration
- Build settings

**Start here if:** You need to customize site settings.

---

### [Layouts Guide](LAYOUTS.md)

Understanding the theme's layout system:

- Layout architecture overview
- Base template structure
- Default layouts (single, list, etc.)
- Page templates (pricing, company, careers, features)
- Partial components
- Creating custom layouts
- Layout variables reference

**Start here if:** You want to understand or modify page templates.

---

### [Shortcodes Reference](SHORTCODES.md)

Complete documentation for all 21 shortcodes:

**Hero & Layout:**
- `hero` - Hero sections with gradient backgrounds
- `hero-image` - Simple hero images
- `section-container` - Section wrappers
- `features-section` - Feature collection containers

**Features & Benefits:**
- `feature` - Feature displays with images
- `features-list` - Vertical feature lists
- `benefits-grid` - Benefit card grids
- `value-card` - Company value cards

**Social Proof:**
- `testimonials` - Customer testimonial carousels
- `client-logos` - Animated logo carousels
- `stat` - Statistics display

**Pricing:**
- `pricing-table-1` - Simple pricing tables
- `pricing-table-2` - Advanced pricing tables

**Team & Company:**
- `team-member` - Team member cards
- `investor-logo` - Investor/partner logos
- `case-study-card` - Case study cards

**Content:**
- `cta` - Call-to-action sections
- `faq` - FAQ accordions
- `toc` - Table of contents
- `figure` - Images with captions
- `code` - Code blocks with syntax highlighting

**Start here if:** You're building pages with shortcodes.

---

### [Styling Guide](STYLING.md)

Everything about the theme's styling system:

- TailwindCSS integration and configuration
- Color system (primary and secondary palettes)
- Typography (Inter and Plus Jakarta Sans)
- Custom components (buttons, cards, etc.)
- Responsive design patterns
- Syntax highlighting themes
- Custom CSS and utilities
- Performance optimization

**Start here if:** You want to customize colors, fonts, or styles.

---

### [Multilingual Guide](MULTILINGUAL.md)

Complete guide to creating multilingual sites:

- Setting up multiple languages
- Language switcher configuration
- Content organization by language
- Per-language menu configuration
- Smart link generation
- Desktop and mobile language switching
- Troubleshooting multilingual issues
- Best practices for international sites

**Start here if:** You're building a multilingual or international website.

---

### [Content Creation Guide](CONTENT-CREATION.md)

Learn how to create and organize content:

- Content structure and organization
- Front matter options
- Page types (homepage, features, pricing, etc.)
- Creating blog posts
- Creating documentation pages
- Using taxonomies (categories and tags)
- Media management and image optimization
- SEO best practices
- Markdown formatting
- Draft and scheduled content

**Start here if:** You're ready to add content to your site.

---

### [Deployment Guide](DEPLOYMENT.md)

Deploy your site to production:

- Building for production
- Platform-specific guides:
  - Netlify
  - Vercel
  - GitHub Pages
  - Cloudflare Pages
  - AWS S3 + CloudFront
- Custom server deployment (Nginx, Apache)
- Environment variables
- Performance optimization
- Continuous deployment
- Testing before deployment

**Start here if:** You're ready to launch your site.

---

### [Troubleshooting Guide](TROUBLESHOOTING.md)

Solutions to common problems:

- Installation issues
- Build errors
- Styling problems
- Content issues
- Deployment problems
- Performance issues
- Browser compatibility
- Getting help and reporting issues

**Start here if:** You're experiencing issues.

---

## 🎯 Common Tasks

### How do I...?

**...install the theme?**
→ See [Installation Guide](INSTALLATION.md)

**...customize colors?**
→ See [Styling Guide - Color System](STYLING.md#color-system)

**...create a blog post?**
→ See [Content Creation - Blog Posts](CONTENT-CREATION.md#blog-posts)

**...add a pricing page?**
→ See [Shortcodes - Pricing Tables](SHORTCODES.md#pricing)

**...configure the header menu?**
→ See [Configuration - Menu Configuration](CONFIGURATION.md#menu-configuration)

**...deploy to Netlify?**
→ See [Deployment - Netlify](DEPLOYMENT.md#netlify)

**...add team members?**
→ See [Shortcodes - Team Member](SHORTCODES.md#team-member)

**...enable multilingual support?**
→ See [Multilingual Guide](MULTILINGUAL.md)

**...enable Google Analytics?**
→ See [Configuration - Analytics](CONFIGURATION.md#analytics-configuration)

**...customize fonts?**
→ See [Styling - Typography](STYLING.md#typography)

**...fix build errors?**
→ See [Troubleshooting - Build Errors](TROUBLESHOOTING.md#build-errors)

## 🌟 Key Features

This theme includes:

- ✅ **21 Pre-built Shortcodes** - Hero sections, features, pricing tables, testimonials, and more
- ✅ **TailwindCSS Integration** - Modern, utility-first CSS framework
- ✅ **Responsive Design** - Mobile-first, looks great on all devices
- ✅ **Performance Optimized** - Fast builds, minimal JavaScript, optimized assets
- ✅ **SEO Ready** - Meta tags, Open Graph, Twitter Cards
- ✅ **Multilingual Support** - Built-in language switcher for international sites
- ✅ **Blog System** - Categories, tags, sidebar, table of contents
- ✅ **Multiple Page Templates** - Pricing, features, company, careers, jobs
- ✅ **Analytics Integration** - Google Analytics and Tag Manager support
- ✅ **Syntax Highlighting** - Beautiful code blocks with dark theme
- ✅ **Easy Customization** - Configurable colors, fonts, and layouts

## 📋 Requirements

- **Hugo Extended** v0.80.0 or higher
- **Node.js** v14.x or higher
- **npm** or **yarn**
- **Git** (for submodule installation)

## 🔗 Useful Links

- [Demo Site](https://saasify-demo.chaoming.li)
- [GitHub Repository](https://github.com/chaoming/hugo-saasify-theme)
- [Report Issues](https://github.com/chaoming/hugo-saasify-theme/issues)
- [Hugo Documentation](https://gohugo.io/documentation/)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)

## 🤝 Support

Need help?

1. **Check the Documentation** - Start with the relevant guide above
2. **Review Troubleshooting** - See [Troubleshooting Guide](TROUBLESHOOTING.md)
3. **Search Issues** - Check [existing issues](https://github.com/chaoming/hugo-saasify-theme/issues)
4. **Ask for Help** - Open a [new issue](https://github.com/chaoming/hugo-saasify-theme/issues/new) with:
   - Hugo version (`hugo version`)
   - Node version (`node --version`)
   - Error messages
   - Steps to reproduce
   - Your configuration

## 📝 License

This theme is released under the [MIT License](../LICENSE).

## 👨‍💻 Author

Created by [Chaoming Li](https://chaoming.li)

## 🎉 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

**Ready to get started?** Begin with the [Installation Guide](INSTALLATION.md) →
