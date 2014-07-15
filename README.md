# tmplt [![Gem Version](http://img.shields.io/gem/v/tmplt.svg)](https://rubygems.org/gems/tmplt) [![Build Status](https://img.shields.io/travis/yuanqing/tmplt.svg)](https://travis-ci.org/yuanqing/tmplt) [![Coverage Status](https://img.shields.io/coveralls/yuanqing/tmplt.svg)](https://coveralls.io/r/yuanqing/tmplt)

A Ruby gem for interpolating values from a hash into a template string.

## Usage

Straight-up substitution, nothing more:

```ruby
tmpl = "{{ foo }}, {{ bar.baz }}!"
data = {
  :foo => "Hello",
  :bar => {
    :baz => "World"
  }
}
puts Tmplt.render(tmpl, data) #=> "Hello, World!"
```

Full usage details are in [the tests](https://github.com/yuanqing/tmplt/blob/master/spec/tmplt_spec.rb).

## Installation

Via [RubyGems](https://rubygems.org/), of course:

```
$ gem install tmplt
```

## License

MIT license
