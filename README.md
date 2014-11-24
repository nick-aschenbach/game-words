# Game Words

Find words, phrases, songs, movies, characters, actions and sayings for
Pictionary, Catchphrase, Charades or the holidays. Each game has several
categories and difficulty levels. This library returns a word list for
some or all categories (nearly 5,000 in all).

A command line interface is provided in addition to the Ruby library

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'game_words'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install game_words
```

## Command Line Usage

Show all words for a game:

```bash
$ gamewords charades
```

Show all words for a specific game category:

```bash
$ gamewords catchphrase people
```

Show a list of games:

```bash
$ gamewords -l
```

Show a list of categories for a game:

```bash
$ gamewords -c pictionary
```

Show a single random word or phrase:

```bash
$ gamewords -r holidays newyears
```

## Library Usage

Show all words for a game:

```ruby
gen = GameWords::Generator.new
gen.words 'catchphrase'
```

Show the words for a specific game category:

```ruby
gen.words 'charades', 'hard'
```

Show a list of games:

```ruby
gen.games
```

Show the categories for a game:
```ruby
gen.game_categories 'pictionary'
```

Easily show a random word:

```ruby
gen.words('pictionary', 'easy').sample
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gamewords/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
