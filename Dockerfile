# Build the example site with the theme
FROM hugomods/hugo:exts AS builder

WORKDIR /src

# Copy theme files
COPY . /src/theme/

# Set up exampleSite with theme symlink
WORKDIR /src/site
COPY exampleSite/ .
RUN mkdir -p themes && ln -s /src/theme themes/hugo-saasify-theme

# Override theme reference (exampleSite uses relative path "../..")
RUN sed -i 's|theme = "../.."|theme = "hugo-saasify-theme"|' hugo.toml

# Fix TailwindCSS content path to scan theme layouts in Docker context
RUN sed -i 's|"../layouts/\*\*/\*.html"|"./themes/hugo-saasify-theme/layouts/**/*.html"|' tailwind.config.js

# Init git repo (required by enableGitInfo in hugo.toml)
RUN git config --global user.email "docker@build" && git config --global user.name "Docker" \
    && git init && git add -A && git commit -m "init"

# Install dependencies and build (npm run build = tailwindcss + hugo --minify)
RUN npm install && npm run build

# Serve with nginx
FROM nginx:alpine
COPY --from=builder /src/site/public /usr/share/nginx/html
EXPOSE 80
