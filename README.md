# PictureTag

[![Build Status](https://travis-ci.org/tomasc/picture_tag.svg)](https://travis-ci.org/tomasc/picture_tag) [![Gem Version](https://badge.fury.io/rb/picture_tag.svg)](http://badge.fury.io/rb/picture_tag) [![Coverage Status](https://img.shields.io/coveralls/tomasc/picture_tag.svg)](https://coveralls.io/r/tomasc/picture_tag)

Rails helper for `<picture>` tag integrated with [Picturefill](http://scottjehl.github.io/picturefill/).

## Installation

Add this to your application's Gemfile:

```ruby
  gem 'picture_tag'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install picture_tag
```

In case you would like to add a picture polyfill:

```ruby
  source 'https://rails-assets.org' do
    gem 'rails-assets-picturefill'
  end
```

And add to your `application.js`:

```JS
//= require picture_tag
```

## Usage

```Slim
= picture_tag '/images/fallback.jpg', image: { alt: 'Your smart alt attribute' } do
  = source_tag srcset: '/images/large.jpg', media: '(min-width: 2000px)', sizes: '100vw'
  = source_tag srcset: '/images/large_retina.jpg 2x', media: '(min-width: 2000px)', sizes: '100vw'
  = source_tag srcset: '/images/medium.jpg', media: '(min-width: 1000px)', sizes: '100vw'
  = source_tag srcset: '/images/medium_retina.jpg 2x', media: '(min-width: 1000px)', sizes: '100vw'
  = source_tag srcset: '/images/small.jpg', sizes: '100vw'
  = source_tag srcset: '/images/small_retina.jpg 2x', sizes: '100vw'
```

produces

```HTML
<picture>
  <source srcset="/images/large.jpg" media="(min-width: 2000px)" sizes="100vw">
  <source srcset="/images/large_retina.jpg 2x" media="(min-width: 2000px)" sizes="100vw">
  <source srcset="/images/medium.jpg" media="(min-width: 1000px)" sizes="100vw" >
  <source srcset="/images/medium_retina.jpg 2x" media="(min-width: 1000px)" sizes="100vw" >
  <source srcset="/images/small.jpg" sizes="100vw">
  <source srcset="/images/small_retina.jpg 2x" sizes="100vw">
  <img alt="Your smart alt attribute" srcset="/images/fallback.jpg">
</picture>
```

Note that the mandatory `img` tag is automatically generated based on the arguments passed to the `picture_tag`.

## More information

* [Picturefill](http://scottjehl.github.io/picturefill/), the neat polyfill used by this gem
* [Specification](http://picture.responsiveimages.org/) provided by [Responsive Images Community Group](http://responsiveimages.org)

## Contributing

1. Fork it ( https://github.com/tomasc/picture_tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
