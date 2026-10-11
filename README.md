# My Personal Blog

Classless CSS. No Javascript. Written in Buzz.

### Dependencies

- [mise](https://mise.jdx.dev) - `mise install` fetches the magus release pinned in `mise.toml`

### Build

```
mise install
mise exec -- magus run lint
mise exec -- magus run build
```

The site is classless: `lint` runs stylelint over `_includes/style.css` and fails on any class or id selector, and `build` fails if any generated page contains a `class` or `style` attribute.

Colors live only in `colors.buzz`. The build turns them into the stylesheet's custom properties and fails if any color drops below its WCAG contrast target; `magus run colors-report` prints each ratio.

### Deploy

A push to `development` runs [`.github/workflows/pages.yaml`](.github/workflows/pages.yaml), which builds the site and publishes it with GitHub Pages. Pull requests build but do not publish. The custom domain is set in the repository's Pages settings.

### Misc

#### Image Compression

```
mogrify -strip -interlace Plane -sampling-factor 4:2:0 -quality 85% *.jpg
```



### License

The following directories are copyright Eli Gladman. You may not reuse anything therein without permission:
- `_posts/`
- `_public/img/`

All other directories are licensed under The Unlicense.
