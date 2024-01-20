# whichlang

This implements `detect_language` bindings from the Rust library [Whichlang](https://github.com/quickwit-oss/whichlang/).

Supported Languages:
```
Ara
Cmn
Deu
Eng
Fra
Hin
Ita
Jpn
Kor
Nld
Por
Rus
Spa
Swe
Tur
Vie
Unknown
```

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     whichlang:
       github: bendangelo/whichlang
   ```

2. Run `shards install`

## Usage

```crystal
require "whichlang"

input = "this is the best day ever"
Whichlang.detect(input) # => Whichlang::Lang::Eng

# for nil responses
input = " "
Whichlang.detect?(input) # => nil
```

## Contributing

1. Fork it (<https://github.com/bendangelo/whichlang/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Ben D'Angelo](https://github.com/bendangelo) - creator and maintainer
