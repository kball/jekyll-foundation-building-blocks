# jekyll-foundation-building-blocks
A Jekyll plugin to make it easy to install [Foundation Building Blocks](http://foundation.zurb.com/building-blocks).

To install into a Jekyll project, put in your Gemfile inside the `:jekyll_plugins` group. E.g.

```
group :jekyll_plugins do
  gem "my_fancy_jekyll_plugin"
end
```

Simply run

```
jekyll blocks list
```

To get a list of available building blocks

``
jekyll blocks install BLOCK_NAME
```

Will automatically install the block HTML in your `_includes` folder, the SCSS into your `_sass` folder, and the JS into your `js` folder.

Files are placed into building-blocks subfolders to avoid clobbering. So final files will be in `_includes/building-blocks/`, `_sass/components/building-blocks/`, and `js/building-blocks/`

There is also support for Foundation Kits via

```
jekyll kits list
```

To get a list of available kits

```
jekyll kits install KIT_NAME
```


## NOTE

As of right now, the scss and js files are not automatically added to your build, as I don't know if there's a standard approach
for doing this within Jekyll.  In the ZURB stack we automatically add these because this is standardized. If you know of a standard
with regards to this for Jekyll, feel free to put together a PR or let me know and I'll add it. :)
