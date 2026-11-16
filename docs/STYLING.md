# Styling Guide

Complete guide to styling and customization in the Hugo Saasify Theme. Learn how to customize colors, typography, components, and create your own design system.

## Table of Contents

- [Tailwind CSS Integration](#tailwind-css-integration)
- [Color System](#color-system)
- [Typography](#typography)
- [Custom Components](#custom-components)
- [Responsive Design](#responsive-design)
- [Syntax Highlighting](#syntax-highlighting)
- [Customization](#customization)
- [Best Practices](#best-practices)

## Tailwind CSS Integration

The Hugo Saasify Theme is built with Tailwind CSS v3, providing a utility-first approach to styling.

### How It Works

1. **Main CSS File**: `themes/hugo-saasify-theme/assets/css/main.css`
2. **Tailwind Config**: `tailwind.config.js` (copied to site root during installation)
3. **PostCSS Config**: `postcss.config.js` (copied to site root during installation)
4. **Hugo Processing**: Automatic PostCSS compilation
5. **Build Stats**: Required for PurgeCSS optimization

### Configuration File

**Location**: `tailwind.config.js` (in your site root)

During installation, you copied this file from `themes/hugo-saasify-theme/tailwind.config.copy.js` to your site root as `tailwind.config.js`.

```javascript
module.exports = {
  content: ["./layouts/**/*.html"],
  theme: {
    extend: {
      colors: {
        primary: { /* custom colors */ },
        secondary: { /* custom colors */ }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        heading: ['Plus Jakarta Sans', 'sans-serif']
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography')
  ]
}
```

### Tailwind Plugins

The theme includes two official plugins:

1. **@tailwindcss/forms** - Beautiful form styling
2. **@tailwindcss/typography** - Prose content styling

## Color System

The theme uses a comprehensive color palette with primary and secondary colors.

### Primary Colors

Blue-based palette for main brand elements.

```javascript
primary: {
  50: '#eef1fc',   // Lightest
  100: '#dde3f9',
  200: '#bbc7f3',
  300: '#99abec',
  400: '#778fe6',
  500: '#5573df',  // Base
  600: '#425ad6',  // Main (default)
  700: '#3548ab',
  800: '#283680',
  900: '#1b2456'   // Darkest
}
```

### Secondary Colors

Purple-based palette for accents and highlights.

```javascript
secondary: {
  50: '#faf5ff',   // Lightest
  100: '#f3e8ff',
  200: '#e9d5ff',
  300: '#d8b4fe',
  400: '#c084fc',
  500: '#a855f7',  // Base
  600: '#9333ea',  // Main (default)
  700: '#7e22ce',
  800: '#6b21a8',
  900: '#581c87'   // Darkest
}
```

### Using Colors

**In Templates**:
```html
<div class="bg-primary-600 text-white">Primary background</div>
<div class="text-secondary-600">Secondary text</div>
<button class="bg-primary-600 hover:bg-primary-700">Button</button>
```

**In Custom CSS**:
```css
.custom-element {
  @apply bg-primary-50 text-primary-900;
}
```

### Customizing Colors

To change the color scheme, edit `tailwind.config.js`:

```javascript
theme: {
  extend: {
    colors: {
      primary: {
        50: '#your-color',
        100: '#your-color',
        // ... continue for all shades
        900: '#your-color'
      }
    }
  }
}
```

**Quick Method** - Use a color palette generator:
1. Choose your base color
2. Generate shades using tools like [Tailwind Shades](https://tailwindshades.com/)
3. Replace values in `tailwind.config.js`

### Gray Scale

Default Tailwind gray scale is available:

```html
<div class="bg-gray-50">Light gray background</div>
<div class="bg-gray-100">...</div>
<!-- ... -->
<div class="bg-gray-900">Dark gray background</div>
```

## Typography

The theme uses two modern typefaces for optimal readability and visual appeal.

### Font Families

**Body Text**: Inter
- Variable font for optimal loading
- Used for all body text, UI elements
- Applied to: paragraphs, lists, forms, buttons

**Headings**: Plus Jakarta Sans
- Bold, modern sans-serif
- Used for all headings (h1-h6)
- Applied to: titles, section headers

### Font Configuration

**Tailwind Config**:
```javascript
fontFamily: {
  sans: ['Inter', 'system-ui', 'sans-serif'],
  heading: ['Plus Jakarta Sans', 'sans-serif']
}
```

**CSS Application**:
```css
body {
  @apply font-sans text-gray-700;
}

h1, h2, h3, h4, h5, h6 {
  @apply font-heading font-bold text-gray-900;
}
```

### Font Loading

By default, fonts are loaded via Google Fonts CDN in the base template:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">
```

This means every visitor's browser contacts Google. If you would rather avoid third-party requests (for privacy or GDPR reasons, or to build a site that works offline), turn the Google Fonts tags off in your site configuration:

```toml
[params.fonts]
  googleFonts = false
```

With nothing else configured, text then falls back to the next fonts in each stack (`system-ui, sans-serif`), which is a perfectly good option. To keep the theme's look, self-host the fonts:

1. **Download the font files.** Both fonts are published under the SIL Open Font License. Get `woff2` files for Inter (weights 400, 500, 600, 700) and Plus Jakarta Sans (weights 600, 700, 800), e.g. from [Google Fonts](https://fonts.google.com/), [google-webfonts-helper](https://gwfh.mranftl.com/fonts) or [Fontsource](https://fontsource.org/). A variable font file per family covers all weights.

2. **Add them to your site** under `static/fonts/`.

3. **Declare them** in your site's `layouts/partials/custom-head.html` (see [Custom Head Content](CONFIGURATION.md#custom-head-content)):

```html
<!-- layouts/partials/custom-head.html -->
<style>
  @font-face {
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400 700;
    font-display: swap;
    src: url('/fonts/Inter-Variable.woff2') format('woff2');
  }
  @font-face {
    font-family: 'Plus Jakarta Sans';
    font-style: normal;
    font-weight: 600 800;
    font-display: swap;
    src: url('/fonts/PlusJakartaSans-Variable.woff2') format('woff2');
  }
</style>
```

If you use static (non-variable) files, add one `@font-face` rule per weight with a single `font-weight` value. No Tailwind changes are needed: `tailwind.config.js` already refers to the fonts by name.

### Typography Scale

**Headings**:
```html
<h1 class="text-4xl md:text-5xl lg:text-6xl">Main Heading</h1>
<h2 class="text-3xl md:text-4xl">Section Heading</h2>
<h3 class="text-2xl md:text-3xl">Subsection Heading</h3>
<h4 class="text-xl md:text-2xl">Small Heading</h4>
```

**Body Text**:
```html
<p class="text-base">Normal text (16px)</p>
<p class="text-lg">Large text (18px)</p>
<p class="text-xl">XL text (20px)</p>
<p class="text-sm">Small text (14px)</p>
```

### Custom Fonts

To use different fonts:

1. **Add Font Files** to `static/fonts/` or use CDN
2. **Update Tailwind Config**:
```javascript
fontFamily: {
  sans: ['Your Font', 'system-ui', 'sans-serif'],
  heading: ['Your Heading Font', 'sans-serif']
}
```
3. **Load Font** in baseof.html or CSS

## Custom Components

Pre-built component classes for common UI elements.

### Buttons

**Primary Button**:
```html
<a href="#" class="btn-primary">Get Started</a>
```

CSS:
```css
.btn {
  @apply inline-flex items-center justify-center px-6 py-3 font-medium transition duration-200 ease-in-out;
  border-radius: 2rem;
}

.btn-primary {
  @apply btn bg-primary-600 text-white hover:bg-primary-700 hover:scale-105;
}
```

**Secondary Button**:
```html
<a href="#" class="btn-secondary">Learn More</a>
```

**Outline Button**:
```html
<a href="#" class="btn-outline">View Demo</a>
```

### Cards

**Standard Card**:
```html
<div class="card">
  <h3>Card Title</h3>
  <p>Card content goes here</p>
</div>
```

CSS:
```css
.card {
  @apply bg-white p-6 transition duration-200 hover:shadow-md;
  border-radius: 2rem;
}
```

### Container

**Responsive Container**:
```html
<div class="container">
  <!-- Content automatically centered with responsive padding -->
</div>
```

CSS:
```css
.container {
  @apply mx-auto px-4 sm:px-6 lg:px-8 max-w-7xl;
}
```

### Sections

**Section Spacing**:
```html
<section class="section">
  <!-- Consistent vertical spacing -->
</section>
```

CSS:
```css
.section {
  @apply py-16 md:py-24;
}
```

### Navigation

**Nav Links**:
```html
<a href="#" class="nav-link">Features</a>
```

CSS:
```css
.nav-link {
  @apply text-gray-600 hover:text-primary-600 font-bold transition duration-200;
}
```

### Grids

**Feature Grid**:
```html
<div class="feature-grid">
  <div>Feature 1</div>
  <div>Feature 2</div>
  <div>Feature 3</div>
</div>
```

CSS:
```css
.feature-grid {
  @apply grid gap-8 md:grid-cols-2 lg:grid-cols-3;
}
```

## Responsive Design

The theme is mobile-first and fully responsive.

### Breakpoints

Tailwind's default breakpoints:

```javascript
sm: '640px',   // Small devices
md: '768px',   // Medium devices
lg: '1024px',  // Large devices
xl: '1280px',  // Extra large devices
2xl: '1536px'  // 2X large devices
```

### Responsive Utilities

**Responsive Visibility**:
```html
<div class="hidden md:block">Visible on medium screens and up</div>
<div class="block md:hidden">Visible only on small screens</div>
```

**Responsive Spacing**:
```html
<div class="py-8 md:py-12 lg:py-16">
  Responsive padding
</div>
```

**Responsive Grid**:
```html
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
  <!-- Responsive columns -->
</div>
```

**Responsive Text**:
```html
<h1 class="text-3xl md:text-4xl lg:text-5xl">
  Responsive heading
</h1>
```

### Mobile Menu

The header includes a responsive mobile menu that automatically adapts to smaller screens.

## Syntax Highlighting

Code blocks are styled with custom syntax highlighting.

### Configuration

**Hugo Config** (`hugo.toml`):
```toml
[markup.highlight]
  noClasses = false
  lineNos = true
  codeFences = true
  guessSyntax = true
  lineNumbersInTable = true
```

### Highlight Styles

**Base Styles**:
```css
.highlight {
  @apply text-sm font-mono text-gray-200;
}
```

**Syntax Colors**:
```css
/* Keywords */
.highlight .k, .highlight .kd {
  @apply text-purple-400 font-semibold;
}

/* Functions */
.highlight .nf, .highlight .nx {
  @apply text-blue-400;
}

/* Strings */
.highlight .s, .highlight .s1, .highlight .s2 {
  @apply text-green-400;
}

/* Numbers */
.highlight .mi, .highlight .mf {
  @apply text-orange-400;
}

/* Comments */
.highlight .c, .highlight .c1, .highlight .cm {
  @apply text-gray-500 italic;
}

/* Operators */
.highlight .o {
  @apply text-yellow-400;
}

/* Punctuation */
.highlight .p {
  @apply text-gray-400;
}
```

### Line Numbers

Line numbers are styled with table layout for better copy/paste experience:

```css
.highlight table td:first-child {
  @apply pr-4 text-right select-none text-gray-500 border-r border-gray-700;
}
```

### Customizing Syntax Theme

To use a different color scheme, modify the `.highlight` classes in `assets/css/main.css`.

## Prose Styling

Blog posts and content pages use prose styling.

### Prose Classes

The theme includes custom prose styling:

```css
.prose {
  @apply max-w-none;
}

.prose h1 {
  @apply text-4xl mb-8;
}

.prose h2 {
  @apply text-3xl mt-12 mb-6;
}

.prose h3 {
  @apply text-2xl mt-8 mb-4;
}

.prose p {
  @apply text-gray-700 leading-relaxed mb-6;
}

.prose a {
  @apply text-primary-600 hover:text-primary-700 no-underline;
}

.prose ul, .prose ol {
  @apply my-6 ml-6;
}

.prose blockquote {
  @apply border-l-4 border-gray-200 pl-4 italic text-gray-700 my-8;
}

.prose code:not(pre code) {
  @apply bg-gray-100 text-gray-900 px-1.5 py-0.5 rounded text-sm font-mono;
}
```

### Using Prose

Wrap content in prose class:

```html
<article class="prose prose-lg">
  {{ .Content }}
</article>
```

## Customization

### Adding Custom CSS

1. **Create Custom CSS File**:
`static/css/custom.css`

```css
/* Your custom styles */
.my-custom-class {
  background: linear-gradient(to right, #your-colors);
}
```

2. **Add to Configuration**:
```toml
[params]
  customCSS = ["css/custom.css"]
```

### Extending Tailwind

**Add to `tailwind.config.js`**:

```javascript
module.exports = {
  theme: {
    extend: {
      // Custom spacing
      spacing: {
        '128': '32rem',
        '144': '36rem'
      },
      // Custom colors
      colors: {
        'brand': '#your-color'
      },
      // Custom border radius
      borderRadius: {
        'xl': '1.5rem',
        '2xl': '2rem'
      }
    }
  }
}
```

### Overriding Component Styles

To override existing components:

1. **Copy Original** from `themes/.../assets/css/main.css`
2. **Add to Your CSS** in project root `assets/css/custom.css`
3. **Import After Main** in your build process

Or use `@layer` directive:

```css
@layer components {
  .btn-primary {
    @apply bg-red-600 hover:bg-red-700;
  }
}
```

### Custom Color Scheme

Complete color scheme override:

```javascript
// tailwind.config.js in your site root
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#f0f9ff',
          100: '#e0f2fe',
          // ... your colors
          900: '#0c4a6e'
        },
        secondary: {
          // ... your secondary palette
        }
      }
    }
  }
}
```

### Dark Mode Support

To add dark mode support:

1. **Enable in Tailwind Config**:
```javascript
module.exports = {
  darkMode: 'class', // or 'media'
  // ...
}
```

2. **Add Dark Variants**:
```html
<div class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white">
  Content
</div>
```

3. **Toggle Script** (add to baseof.html):
```javascript
// Dark mode toggle logic
```

## Best Practices

### 1. Use Tailwind Utilities First

Prefer Tailwind utilities over custom CSS:

```html
<!-- Good -->
<div class="flex items-center justify-between p-4 bg-white rounded-lg shadow">

<!-- Avoid -->
<div class="custom-header" style="...">
```

### 2. Extract Repeated Patterns

For repeated patterns, create component classes:

```css
@layer components {
  .product-card {
    @apply bg-white rounded-2xl p-6 shadow-sm hover:shadow-lg transition;
  }
}
```

### 3. Maintain Consistency

Use the theme's design tokens:
- Colors from the palette
- Spacing from the scale
- Typography from defined classes

### 4. Optimize for Performance

- Use PurgeCSS (automatic with Hugo)
- Minimize custom CSS
- Avoid `!important`
- Use efficient selectors

### 5. Accessibility

- Maintain color contrast ratios (WCAG AA minimum)
- Use semantic HTML
- Include focus states
- Test with keyboard navigation

### 6. Mobile-First

Build mobile layouts first:

```html
<!-- Mobile first, then desktop -->
<div class="text-sm md:text-base lg:text-lg">
```

### 7. Test Across Browsers

- Chrome/Edge (Chromium)
- Firefox
- Safari
- Mobile browsers

## Testing Styles

### Local Development

```bash
# Watch for changes
hugo server -D

# Clear cache if styles don't update
hugo --gc
hugo server -D
```

### Build for Production

```bash
# Build with minification
hugo --minify

# Check file sizes
ls -lh public/css/
```

### Browser Testing

1. Chrome DevTools - Responsive mode
2. Firefox Developer Tools
3. Safari Web Inspector
4. Real device testing

## Related Documentation

- [CONFIGURATION.md](CONFIGURATION.md) - Theme configuration
- [LAYOUTS.md](LAYOUTS.md) - Layout templates
- [CONTENT-CREATION.md](CONTENT-CREATION.md) - Creating content
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common issues

## Additional Resources

- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Tailwind CSS Typography Plugin](https://tailwindcss.com/docs/typography-plugin)
- [Hugo Asset Processing](https://gohugo.io/hugo-pipes/)
- [PostCSS Documentation](https://postcss.org/)
