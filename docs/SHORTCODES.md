# Shortcodes Guide

Complete reference for all shortcodes available in the Hugo Saasify Theme. Shortcodes are reusable content components that help you build beautiful pages quickly.

## Table of Contents

- [Hero & Layout](#hero--layout)
- [Features & Benefits](#features--benefits)
- [Social Proof](#social-proof)
- [Pricing](#pricing)
- [Team & Company](#team--company)
- [Content Components](#content-components)
- [Utility Shortcodes](#utility-shortcodes)
- [Usage Tips](#usage-tips)

## Hero & Layout

### hero

Create an eye-catching hero section for your pages.

**Parameters:**
- `headline` (string, required) - Main headline text
- `sub_headline` (string, required) - Subheading text
- `primary_button_text` (string, optional) - Primary CTA button text
- `primary_button_url` (string, optional) - Primary button link
- `secondary_button_text` (string, optional) - Secondary button text
- `secondary_button_url` (string, optional) - Secondary button link
- `hero_image` (string, optional) - Path to hero image
- `background_image` (string, optional) - Background image path
- `gradient-from` (string, optional) - Gradient start color (hex)
- `gradient-to` (string, optional) - Gradient end color (hex)
- `gradient-angle` (integer, optional) - Gradient angle in degrees (default: 180)

**Example:**
```markdown
{{< hero
    headline="Build Your SaaS <span class='text-primary-600'>Faster</span>"
    sub_headline="A modern Hugo theme designed for SaaS and technology companies"
    primary_button_text="Get Started Free"
    primary_button_url="/signup"
    secondary_button_text="View Demo"
    secondary_button_url="/demo"
    hero_image="/images/hero-dashboard.png"
    gradient-from="#2563eb"
    gradient-to="#7c3aed"
    gradient-angle="30"
>}}
```

**With Background Image:**
```markdown
{{< hero
    headline="Welcome to Our Platform"
    sub_headline="Everything you need in one place"
    background_image="/images/hero-bg.jpg"
    primary_button_text="Learn More"
    primary_button_url="/features"
>}}
```

### hero-image

Standalone hero image component.

**Parameters:**
- `src` (string, required) - Image source path
- `alt` (string, optional) - Alternative text

**Example:**
```markdown
{{< hero-image src="/images/product-screenshot.png" alt="Product Dashboard" >}}
```

### section-container

Wrapper for creating consistent section spacing and layout.

**Parameters:**
- `background` (string, optional) - Background color or class
- `padding` (string, optional) - Custom padding classes

**Example:**
```markdown
{{< section-container background="bg-gray-50" >}}
## Your Content Here
This content will be wrapped in a properly spaced section.
{{< /section-container >}}
```

## Features & Benefits

### feature

Display a single feature with icon, title, and description.

**Parameters:**
- `icon` (string, required) - Icon name or SVG
- `title` (string, required) - Feature title
- `description` (string, required) - Feature description
- `image` (string, optional) - Feature image path
- `image_position` (string, optional) - "left" or "right" (default: "right")

**Example:**
```markdown
{{< feature
    icon="zap"
    title="Lightning Fast"
    description="Built with performance in mind. Your site loads in milliseconds."
    image="/images/feature-performance.png"
    image_position="right"
>}}
```

**With Custom Icon:**
```markdown
{{< feature
    title="Secure by Default"
    description="Enterprise-grade security built into every layer"
>}}
<svg>...</svg>
{{< /feature >}}
```

### features-section

Wrapper for multiple features with section header.

**Parameters:**
- `title` (string, optional) - Section title
- `description` (string, optional) - Section description

**Example:**
```markdown
{{< features-section
    title="Why Choose Our Platform"
    description="Everything you need to build and grow your business"
>}}

{{< feature icon="rocket" title="Fast Deployment" description="Deploy in minutes" >}}
{{< feature icon="shield" title="Secure" description="Bank-level security" >}}
{{< feature icon="chart" title="Analytics" description="Deep insights" >}}

{{< /features-section >}}
```

### features-list

Display features in a list format.

**Parameters:**
- `title` (string, optional) - List title

**Example:**
```markdown
{{< features-list title="Key Features" >}}
- Real-time collaboration
- Advanced analytics
- 99.9% uptime SLA
- 24/7 customer support
- Enterprise SSO
- Custom integrations
{{< /features-list >}}
```

### benefits-grid

Display benefits in a grid layout.

**Parameters:**
- `title` (string, optional) - Section heading
- `subtitle` (string, optional) - Section subheading
- `benefit1` … `benefit10` (string) - Each benefit as a pipe-separated string: `"icon|bgColor|title|description"`
  - `icon` — icon name (see icon list in `docs/STYLING.md`)
  - `bgColor` — hex color used at 10% opacity for the icon background (e.g. `#3B82F6`)
  - `title` — benefit heading
  - `description` — benefit body text

**Example:**
```markdown
{{< benefits-grid
    title="Why choose us"
    subtitle="Everything you need to grow"
    benefit1="clock|#3B82F6|Save Time|Automate repetitive tasks and focus on what matters"
    benefit2="dollar|#10B981|Reduce Costs|Cut operational expenses by up to 50%"
    benefit3="users|#8B5CF6|Scale Easily|Grow from 10 to 10,000 users effortlessly"
>}}
```

### value-card

Display a value proposition card.

**Parameters:**
- `icon` (string, required) - Icon name
- `title` (string, required) - Card title
- `description` (string, required) - Card description

**Example:**
```markdown
{{< value-card
    icon="heart"
    title="Customer First"
    description="We put our customers at the center of everything we do"
>}}
```

## Social Proof

### testimonials

Display customer testimonials in a scrolling carousel.

**Parameters:**
- `title` (string, optional) - Section title
- `description` (string, optional) - Section description
- `background-color` (string, optional) - Background color
- `animate` (boolean, optional) - Enable auto-scroll animation (default: true)

**Note:** Testimonials data comes from page front matter.

**Front Matter:**
```yaml
---
title: "Home"
testimonials:
  - name: "Sarah Johnson"
    title: "CEO, TechCorp"
    avatar: "/images/avatar-sarah.jpg"
    quote: "This platform transformed how we work. Highly recommended!"
  - name: "Michael Chen"
    title: "CTO, StartupXYZ"
    avatar: "/images/avatar-michael.jpg"
    quote: "Amazing product with outstanding support. 5 stars!"
  - name: "Emma Davis"
    title: "Product Manager, BigCo"
    avatar: "/images/avatar-emma.jpg"
    quote: "Best decision we made this year. Game changer!"
---
```

**Example:**
```markdown
{{< testimonials
    title="Loved by Teams Worldwide"
    description="See what our customers have to say"
    animate="true"
>}}
```

### client-logos

Display client or partner logos.

**Parameters:**
- `title` (string, optional) - Section title
- `background` (string, optional) - Background color class

**Note:** Logos should be passed as inner content in JSON format.

**Example:**
```markdown
{{< client-logos title="Trusted by Industry Leaders" >}}
{
  "logos": [
    { "src": "/images/clients/company1.svg", "alt": "Company 1" },
    { "src": "/images/clients/company2.svg", "alt": "Company 2" },
    { "src": "/images/clients/company3.svg", "alt": "Company 3" },
    { "src": "/images/clients/company4.svg", "alt": "Company 4" },
    { "src": "/images/clients/company5.svg", "alt": "Company 5" }
  ]
}
{{< /client-logos >}}
```

### case-study-card

Display a case study preview card.

**Parameters:**
- `title` (string, required) - Case study title
- `company` (string, required) - Company name
- `industry` (string, required) - Industry
- `result` (string, required) - Key result/metric
- `image` (string, required) - Card image
- `url` (string, required) - Link to full case study

**Example:**
```markdown
{{< case-study-card
    title="How Acme Corp Increased Revenue by 300%"
    company="Acme Corp"
    industry="E-commerce"
    result="300% revenue increase"
    image="/images/case-studies/acme.jpg"
    url="/case-studies/acme"
>}}
```

## Pricing

### pricing-table-1

Three-column pricing table with feature lists.

**Example:**
```markdown
{{< pricing-table-1 >}}
{
  "title": "Choose Your Plan",
  "description": "Start free, upgrade as you grow",
  "plans": [
    {
      "name": "Starter",
      "description": "Perfect for individuals",
      "price": "0",
      "featured": false,
      "features": [
        "Up to 10 projects",
        "Basic analytics",
        "Email support",
        "1 GB storage"
      ],
      "button": {
        "text": "Start Free",
        "url": "/signup"
      }
    },
    {
      "name": "Professional",
      "description": "For growing teams",
      "price": "29",
      "featured": true,
      "features": [
        "Unlimited projects",
        "Advanced analytics",
        "Priority support",
        "10 GB storage",
        "Custom integrations"
      ],
      "button": {
        "text": "Get Started",
        "url": "/signup?plan=pro"
      }
    },
    {
      "name": "Enterprise",
      "description": "For large organizations",
      "price": "99",
      "featured": false,
      "features": [
        "Everything in Pro",
        "Dedicated support",
        "Unlimited storage",
        "Custom contracts",
        "SLA guarantee"
      ],
      "button": {
        "text": "Contact Sales",
        "url": "/contact"
      }
    }
  ]
}
{{< /pricing-table-1 >}}
```

### pricing-table-2

Alternative pricing table design with comparison features.

**Example:**
```markdown
{{< pricing-table-2 >}}
{
  "title": "Flexible Pricing for Every Team",
  "plans": [
    {
      "name": "Basic",
      "price": "19",
      "period": "month",
      "features": [
        "5 team members",
        "10 GB storage",
        "Basic support"
      ],
      "highlighted": false,
      "cta": {
        "text": "Choose Basic",
        "url": "/signup?plan=basic"
      }
    },
    {
      "name": "Premium",
      "price": "49",
      "period": "month",
      "features": [
        "Unlimited team members",
        "100 GB storage",
        "Priority support",
        "Advanced features"
      ],
      "highlighted": true,
      "cta": {
        "text": "Choose Premium",
        "url": "/signup?plan=premium"
      }
    }
  ]
}
{{< /pricing-table-2 >}}
```

## Team & Company

### team-member

Display a team member card.

**Parameters:**
- `name` (string, required) - Team member name
- `title` (string, required) - Job title
- `image` (string, required) - Profile image path
- `bio` (string, optional) - Short biography
- `linkedin` (string, optional) - LinkedIn URL
- `twitter` (string, optional) - Twitter URL
- `github` (string, optional) - GitHub URL

**Example:**
```markdown
{{< team-member
    name="Jane Doe"
    title="Chief Technology Officer"
    image="/images/team/jane.jpg"
    bio="Jane leads our engineering team with 15 years of experience in SaaS"
    linkedin="https://linkedin.com/in/janedoe"
    twitter="https://twitter.com/janedoe"
>}}
```

### investor-logo

Display investor or partner logo.

**Parameters:**
- `src` (string, required) - Logo image path
- `alt` (string, required) - Alternative text
- `url` (string, optional) - Link URL

**Example:**
```markdown
{{< investor-logo
    src="/images/investors/vc-firm.svg"
    alt="VC Firm"
    url="https://vcfirm.com"
>}}
```

### stat

Display a statistic or metric.

**Parameters:**
- `value` (string, required) - The number/metric
- `label` (string, required) - Description label
- `icon` (string, optional) - Icon name

**Example:**
```markdown
{{< stat value="10,000+" label="Happy Customers" icon="users" >}}
{{< stat value="99.9%" label="Uptime SLA" icon="check" >}}
{{< stat value="24/7" label="Support Available" icon="headphones" >}}
```

## Content Components

### cta

Call-to-action section.

**Parameters:**
- `title` (string, required) - CTA heading
- `description` (string, optional) - CTA description
- `button_text` (string, required) - Button text
- `button_url` (string, required) - Button link
- `background` (string, optional) - Background color/gradient

**Example:**
```markdown
{{< cta
    title="Ready to Get Started?"
    description="Join thousands of teams already using our platform"
    button_text="Start Free Trial"
    button_url="/signup"
    background="gradient"
>}}
```

### faq

Frequently Asked Questions accordion.

**Example:**
```markdown
{{< faq >}}
{
  "title": "Frequently Asked Questions",
  "description": "Find answers to common questions",
  "questions": [
    {
      "question": "How do I get started?",
      "answer": "Simply sign up for a free account and follow our onboarding guide. You'll be up and running in minutes."
    },
    {
      "question": "What payment methods do you accept?",
      "answer": "We accept all major credit cards, PayPal, and wire transfers for enterprise customers."
    },
    {
      "question": "Can I cancel anytime?",
      "answer": "Yes, you can cancel your subscription at any time. No questions asked, no hidden fees."
    },
    {
      "question": "Do you offer refunds?",
      "answer": "We offer a 30-day money-back guarantee. If you're not satisfied, contact us for a full refund."
    }
  ]
}
{{< /faq >}}
```

### toc

Generate a table of contents from page headings.

**Parameters:**
- None (automatically generates from page content)

**Example:**
```markdown
{{< toc >}}
```

**Custom Title:**
```markdown
<div class="table-of-contents">
  <h2>Table of Contents</h2>
  {{< toc >}}
</div>
```

## Utility Shortcodes

### code

Enhanced code block with syntax highlighting.

**Parameters:**
- `lang` (string, required) - Programming language
- `title` (string, optional) - Code block title
- `lineNumbers` (boolean, optional) - Show line numbers (default: true)
- `highlight` (string, optional) - Lines to highlight (e.g., "1-3,5")

**Example:**
```markdown
{{< code lang="javascript" title="app.js" lineNumbers="true" highlight="2-4" >}}
function greet(name) {
  return `Hello, ${name}!`;
}

console.log(greet('World'));
{{< /code >}}
```

**Without Line Numbers:**
```markdown
{{< code lang="python" lineNumbers="false" >}}
def hello_world():
    print("Hello, World!")
{{< /code >}}
```

### figure

Enhanced image with caption and optional link.

**Parameters:**
- `src` (string, required) - Image source
- `alt` (string, required) - Alternative text
- `caption` (string, optional) - Image caption
- `link` (string, optional) - Link URL
- `width` (string, optional) - Image width
- `height` (string, optional) - Image height

**Example:**
```markdown
{{< figure
    src="/images/architecture-diagram.png"
    alt="System Architecture"
    caption="Our microservices architecture overview"
    width="800"
>}}
```

**With Link:**
```markdown
{{< figure
    src="/images/product-thumbnail.jpg"
    alt="Product Screenshot"
    caption="Click to see full size"
    link="/images/product-full.jpg"
>}}
```

## Advanced Shortcodes

### Nested Shortcodes

You can nest shortcodes for complex layouts:

```markdown
{{< section-container background="bg-white" >}}

{{< features-section title="Our Platform" >}}

{{< feature
    icon="zap"
    title="Fast"
    description="Lightning fast performance"
>}}

{{< feature
    icon="lock"
    title="Secure"
    description="Enterprise-grade security"
>}}

{{< /features-section >}}

{{< /section-container >}}
```

### Combining Shortcodes

Create rich page layouts:

```markdown
{{< hero headline="Welcome" ... >}}

{{< client-logos title="Trusted by" >}}
...
{{< /client-logos >}}

{{< features-section title="Features" >}}
...
{{< /features-section >}}

{{< testimonials >}}

{{< pricing-table-1 >}}
...
{{< /pricing-table-1 >}}

{{< faq >}}
...
{{< /faq >}}

{{< cta title="Get Started" ... >}}
```

## Usage Tips

### 1. JSON Formatting

For shortcodes that accept JSON (pricing, FAQ, client logos):
- Use valid JSON syntax
- Ensure proper quotes (double quotes for JSON)
- Validate JSON before adding to content
- Use online JSON validators if needed

### 2. Images

Always use proper image paths:
- Absolute paths from site root: `/images/photo.jpg`
- Or use Hugo's resource management
- Optimize images before uploading
- Use appropriate formats (WebP, PNG, JPG)

### 3. Accessibility

- Always provide `alt` text for images
- Use semantic headings in correct order
- Ensure sufficient color contrast
- Test keyboard navigation

### 4. Performance

- Lazy load images when possible
- Minimize the number of shortcodes per page
- Optimize JSON data structures
- Use appropriate image sizes

### 5. Responsive Design

All shortcodes are mobile-responsive by default:
- Test on multiple screen sizes
- Check touch interactions
- Verify text readability
- Ensure buttons are tappable

### 6. Customization

You can override shortcode templates:
1. Copy shortcode from `themes/hugo-saasify-theme/layouts/shortcodes/`
2. Paste to `layouts/shortcodes/` in your site
3. Modify as needed

### 7. Testing

Before deploying:
- Preview with `hugo server -D`
- Test all interactive elements
- Verify links work
- Check on mobile devices
- Validate HTML output

## Common Patterns

### Landing Page

```markdown
---
title: "Home"
layout: single
---

{{< hero ... >}}
{{< client-logos ... >}}
{{< features-section ... >}}
{{< testimonials >}}
{{< cta ... >}}
```

### Pricing Page

```markdown
---
title: "Pricing"
layout: pricing
---

{{< pricing-table-1 >}}
...
{{< /pricing-table-1 >}}

{{< faq >}}
...
{{< /faq >}}

{{< cta ... >}}
```

### About Page

```markdown
---
title: "About Us"
layout: company
---

{{< hero ... >}}

{{< section-container >}}
## Our Story
...
{{< /section-container >}}

{{< stat ... >}}
{{< stat ... >}}
{{< stat ... >}}

{{< team-member ... >}}
{{< team-member ... >}}
```

### Feature Page

```markdown
---
title: "Features"
layout: feature
---

{{< hero ... >}}

{{< features-section ... >}}
{{< feature ... >}}
{{< feature ... >}}
{{< /features-section >}}

{{< case-study-card ... >}}

{{< cta ... >}}
```

## Troubleshooting

### Shortcode Not Rendering

**Problem**: Shortcode appears as text

**Solutions**:
- Check syntax: `{{<` not `{<`
- Verify shortcode name spelling
- Ensure shortcode file exists
- Check Hugo version compatibility

### JSON Parse Error

**Problem**: Error parsing JSON in shortcode

**Solutions**:
- Validate JSON syntax
- Use double quotes, not single
- Escape special characters
- Check for trailing commas

### Images Not Showing

**Problem**: Images don't display

**Solutions**:
- Verify image path is correct
- Check image exists in `static/` folder
- Use correct path format (`/images/...`)
- Check file permissions

### Styling Issues

**Problem**: Shortcode styling doesn't match

**Solutions**:
- Clear Hugo cache: `hugo --gc`
- Rebuild site: `hugo`
- Check Tailwind compilation
- Verify CSS is loading

## Related Documentation

- [LAYOUTS.md](LAYOUTS.md) - Layout templates
- [CONTENT-CREATION.md](CONTENT-CREATION.md) - Creating content
- [STYLING.md](STYLING.md) - Customizing styles
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common issues

## Additional Resources

- [Hugo Shortcodes Documentation](https://gohugo.io/content-management/shortcodes/)
- [Creating Custom Shortcodes](https://gohugo.io/templates/shortcode-templates/)
- [Theme Shortcode Examples](../exampleSite/content/)
