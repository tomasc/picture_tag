# PictureTag

Rails helper for `<picture>` tag integrated with [Picturefill](http://scottjehl.github.io/picturefill/).

## Installation

Add this line to your application's Gemfile:

    gem 'picture_tag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install picture_tag

To make it work you need to add this to your `application.js`:

    //= require picture_tag

## Usage

```Slim
= picture_tag '/images/fallback.jpg', alt: 'Your smart alt attribute' do
  = source_tag srcset: '/images/extralarge.jpg', media: '(min-width: 1000px)', size: '100vw'
  = source_tag srcset: '/images/large.jpg', media: '(min-width: 800px)', size: '100vw'
  = source_tag srcset: '/images/medium.jpg', size: '100vw'
```

produces

```HTML
<picture>
  <source media="(min-width: 1000px)" size="100vw" srcset="/images/extralarge.jpg">
  <source media="(min-width: 800px)" size="100vw" srcset="/images/large.jpg">
  <source size="100vw" srcset="/images/medium.jpg">
  <img alt="Your smart alt attribute" src="/images/fallback.jpg">
</picture>
```

Note that the mandatory `img` tag is automatically generated based on the arguments passed to the `picture_tag`.

## More information

* [Picturefill](http://scottjehl.github.io/picturefill/), the neat polyfill used by this gem
* [Specification](http://picture.responsiveimages.org/) provided by [Responsive Images Community Group](http://responsiveimages.org)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/picture_tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
