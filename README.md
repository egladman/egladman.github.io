# My Personal Blog

Classless CSS. No Javascript. Written in Bash.

### Dependencies

- [squib](https://github.com/egladman/squib)
- [Markdown](https://github.com/bobtfish/text-markdown) - Install via `cpan` or with your system package manager. (i.e. `dnf install perl-Text-Markdown`)

### Build

```
squib build
```

### Deploy

```
./deploy.sh "eli.gladman.cc"
```

### Misc

#### Image Compression

```
mogrify -strip -interlace Plane -gaussian-blur 0.05 -quality 85% *.jpg
```



### License

The following directories are copyright Eli Gladman. You may not reuse anything therein without permission:
- `posts/`
- `public/img/`

All other directories are licensed under The Unlicense.
