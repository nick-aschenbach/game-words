# Gamewords

Find words, phrases, songs, movies, characters, actions and sayings for
Pictionary, Catchphrase, Charades or the holidays. Each game has several
categories including difficulty levels. This library returns a list for
some or all categories.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'game_words'
```

And then execute:

> bundle

Or install it yourself as:

> gem install game_words

## Usage

Find a list of games:

```ruby
GameWords::Generator.new.games
```

Find the categories for a game:
```ruby
gen = GameWords::Generator.new
gen.game_categories 'pictionary'
```

Get all words for all categories for a game:

```ruby
gen.words 'catchphrase'
```

Get the words for a game and category:

```ruby
gen.words 'charades', 'hard'
```

Easily generate a random word:

```ruby
gen.words('pictionary', 'easy').sample
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gamewords/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
