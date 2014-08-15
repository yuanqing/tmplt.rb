# Tmplt.rb [![Gem Version](http://img.shields.io/gem/v/tmplt.svg?style=flat)](https://rubygems.org/gems/tmplt) [![Build Status](https://img.shields.io/travis/yuanqing/tmplt.rb.svg?style=flat)](https://travis-ci.org/yuanqing/tmplt.rb) [![Coverage Status](https://img.shields.io/coveralls/yuanqing/tmplt.rb.svg?style=flat)](https://coveralls.io/r/yuanqing/tmplt.rb)

> A Ruby gem for interpolating values from a hash or array into a template string.

## Usage

Straight-up substitution, nothing more. Here&rsquo;s a slightly contrived example:

```rb
require 'tmplt'

tmpl = "{{ foo }}, {{ baz.qux }}!"
data = {
  :foo => "Hello",
  :bar => "World",
  :baz => {
    :qux => Proc.new {|d| "#{d[:bar]}" }
  }
}
puts Tmplt.render(tmpl, data) #=> "Hello, World!"
```

More usage examples are in [the tests](https://github.com/yuanqing/tmplt.rb/blob/master/spec/tmplt_spec.rb).

## API

### Tmplt.render(tmpl, data)

Interpolates values from `data` into the `tmpl` string.

- `tmpl` is a `string` with tags enclosed in double braces. Use a dot-delimited tag to reference nested values in `data`.

- `data` can be a `hash` or `array`, with arbitrary nesting. If a `proc` in `data` is referenced in `tmpl`, it will be invoked, and its return value will be substituted into `tmpl`. The `proc` takes a single argument, namely the `data` object itself.

## Installation

Install via [RubyGems](https://rubygems.org/):

```bash
$ gem install tmplt
```

## License

[MIT license](https://github.com/yuanqing/tmplt.rb/blob/master/LICENSE)
