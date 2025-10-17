# Multilingual Support

The Hugo Saasify Theme includes built-in multilingual support with an automatic language switcher that appears in the header navigation.

## Features

- 🌍 **Automatic Language Switcher**: Dropdown menu appears automatically when multiple languages are configured
- 📱 **Responsive Design**: Works seamlessly on both desktop and mobile devices
- 🔗 **Smart Link Generation**: Links to translated pages when available, or homepage for untranslated content
- 🎨 **Consistent Styling**: Matches the theme's design system with dropdown menus

## Configuration

### Basic Setup

To enable multilingual support, add language configuration to your `hugo.toml`:

```toml
# Set default language
defaultContentLanguage = "en"
defaultContentLanguageInSubdir = false

# Define languages
[languages]
  [languages.en]
    languageCode = "en-us"
    languageName = "English"
    weight = 1
    [languages.en.params]
      description = "Your English site description"

  [languages.es]
    languageCode = "es"
    languageName = "Español"
    weight = 2
    [languages.es.params]
      description = "Descripción de tu sitio en español"

  [languages.fr]
    languageCode = "fr"
    languageName = "Français"
    weight = 3
    [languages.fr.params]
      description = "Description de votre site en français"
```

### Language Properties

| Property | Description | Required |
|----------|-------------|----------|
| `languageCode` | ISO language code (e.g., "en-us", "es", "fr") | Yes |
| `languageName` | Display name shown in the language switcher | Yes |
| `weight` | Order of languages (lower numbers appear first) | Yes |
| `params` | Language-specific parameters | Optional |

### Per-Language Menu Configuration

You can customize menus for each language:

```toml
[languages.en.menu]
  [[languages.en.menu.main]]
    name = "Features"
    weight = 1
    [languages.en.menu.main.params]
      has_submenu = true
      submenu = [
        { name = "Performance", url = "/features/performance/" },
        { name = "Design System", url = "/features/design-system/" }
      ]

[languages.es.menu]
  [[languages.es.menu.main]]
    name = "Características"
    weight = 1
    [languages.es.menu.main.params]
      has_submenu = true
      submenu = [
        { name = "Rendimiento", url = "/es/features/performance/" },
        { name = "Sistema de Diseño", url = "/es/features/design-system/" }
      ]
```

## Content Organization

### Directory Structure

Organize content by language using Hugo's content organization:

```
content/
├── _index.md              # English homepage
├── _index.es.md           # Spanish homepage
├── _index.fr.md           # French homepage
├── blog/
│   ├── post-1.md          # English blog post
│   ├── post-1.es.md       # Spanish translation
│   └── post-1.fr.md       # French translation
└── features/
    ├── performance.md      # English feature page
    ├── performance.es.md   # Spanish translation
    └── performance.fr.md   # French translation
```

### Alternative: Language Directories

You can also use language subdirectories:

```
content/
├── en/
│   ├── _index.md
│   └── blog/
│       └── post-1.md
├── es/
│   ├── _index.md
│   └── blog/
│       └── post-1.md
└── fr/
    ├── _index.md
    └── blog/
        └── post-1.md
```

## Language Switcher Behavior

### Desktop View

- Appears in the main navigation bar after menu items
- Shows current language with a globe icon
- Dropdown appears on hover
- Lists all available languages except the current one

### Mobile View

- Appears in the mobile menu after navigation items
- Shows current language with a globe icon
- Expandable section with available languages
- Border separator from other menu items

### Smart Link Generation

The language switcher intelligently handles page translation:

1. **Translated Page Exists**: Links directly to the translated version
   ```
   EN: /blog/my-post/
   ES: /es/blog/my-post/
   ```

2. **No Translation Available**: Links to the homepage in that language
   ```
   EN: /blog/untranslated-post/
   ES: /es/ (homepage)
   ```

## Customization

### Hide Language Switcher

To hide the language switcher (e.g., for single-language sites), simply don't configure multiple languages. The switcher only appears when `[languages]` is defined with 2 or more languages.

### Styling

The language switcher uses the theme's existing dropdown styling configuration from `params.header.menu.dropdown`:

```toml
[params.header.menu.dropdown]
  width = "w-48"                    # Switcher dropdown width
  background = "bg-white"
  border = "border border-gray-100"
  shadow = "shadow-xl"
  radius = "rounded-lg"
  text_color = "text-gray-700"
  hover_background = "hover:bg-gray-50"
  text_size = "text-sm"
```

## Examples

### Two Languages (English/Spanish)

```toml
defaultContentLanguage = "en"

[languages]
  [languages.en]
    languageCode = "en-us"
    languageName = "English"
    weight = 1

  [languages.es]
    languageCode = "es"
    languageName = "Español"
    weight = 2
```

### Three Languages (English/Chinese/Japanese)

```toml
defaultContentLanguage = "en"

[languages]
  [languages.en]
    languageCode = "en-us"
    languageName = "English"
    weight = 1

  [languages.zh]
    languageCode = "zh-cn"
    languageName = "中文"
    weight = 2

  [languages.ja]
    languageCode = "ja"
    languageName = "日本語"
    weight = 3
```

### Five Languages (Global Site)

```toml
defaultContentLanguage = "en"

[languages]
  [languages.en]
    languageCode = "en-us"
    languageName = "English"
    weight = 1

  [languages.es]
    languageCode = "es"
    languageName = "Español"
    weight = 2

  [languages.fr]
    languageCode = "fr"
    languageName = "Français"
    weight = 3

  [languages.de]
    languageCode = "de"
    languageName = "Deutsch"
    weight = 4

  [languages.pt]
    languageCode = "pt-br"
    languageName = "Português"
    weight = 5
```

## Troubleshooting

### Language Switcher Not Appearing

**Issue**: The language switcher doesn't show up in the header.

**Solutions**:
1. Verify you have at least 2 languages configured in `[languages]`
2. Check that each language has `languageName` defined
3. Ensure the theme is up to date with the language switcher component

### Incorrect Language Links

**Issue**: Language switcher links go to wrong pages.

**Solutions**:
1. Verify content files are named correctly (e.g., `page.es.md` for Spanish)
2. Check `defaultContentLanguageInSubdir` setting
3. Ensure `baseURL` is correctly configured

### Language Names Not Displaying

**Issue**: Language names appear as codes instead of readable names.

**Solution**: Make sure `languageName` is set for each language:
```toml
[languages.en]
  languageName = "English"  # Not just languageCode
```

## Best Practices

1. **Consistent Translations**: Try to translate all important pages for better user experience
2. **Language Codes**: Use standard ISO language codes (en, es, fr, de, etc.)
3. **Language Names**: Use native language names (Español, Français, Deutsch)
4. **Weight Order**: Order languages by target audience priority
5. **URL Structure**: Keep URLs consistent across languages when possible
6. **SEO**: Add hreflang tags for better SEO (Hugo handles this automatically)

## Additional Resources

- [Hugo Multilingual Mode](https://gohugo.io/content-management/multilingual/)
- [Hugo Language Configuration](https://gohugo.io/getting-started/configuration/#configure-languages)
- [Content Translation Guide](https://gohugo.io/content-management/multilingual/#translation-by-content-directory)
