# HTML Tag builder

URL parser and builder with few extra features

https://github.com/dux/lux-url

## Install

### Gemfile

`gem 'lux-url'`

### Manual require

`require 'lux-url'`

## Usage

Example

```ruby
url = Url.new 'https://sub1.sub2.lvh.me:3000/:attr1:attr2-val/some/path/menu:demo?foo=bar'

url[:foo]   # bar -> shortcut to url.qs(:foo)
url[:menu]  # demo -> unless querystring is found, we will look at path querystring
url.path    # /:attr1:attr2-val/some/path/menu:demo
url.path_qs # {"menu" => "demo"}
url.qs      # {"foo" => "bar"}

url.path_prefix # ['attr1', 'attr2-val']

url.to_s # https://sub1.sub2.lvh.me:3000/:attr1:attr2-val/some/path/menu:demo?foo=bar
```

## Dependency

none

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dux/lux-url.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).