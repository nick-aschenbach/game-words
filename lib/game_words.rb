require 'game_words/version'
require 'yaml'

module GameWords
  WORDS_PATH = File.join(File.dirname(__dir__), 'assets', 'game_words', 'game_words.yaml')

  class Generator
    def initialize
      @game_words = YAML.load_file(WORDS_PATH)
    end

    def games
      @game_words.keys
    end

    def game_categories(game)
      return [] unless is_a_valid_game?(game)

      game_words = @game_words[game]
      game_words.keys
    end

    def words(game, category = nil)
      return [] unless is_a_valid_game?(game)
      return [] unless category.nil? || is_a_valid_game_category?(game, category)

      words = @game_words[game][category]
      return words if words

      all_words = []
      @game_words[game].keys.each do |category|
        all_words += @game_words[game][category]
      end
      all_words
    end

    private

    def is_a_valid_game?(game)
      return true if @game_words[game]

      false
    end

    def is_a_valid_game_category?(game, category)
      return true if @game_words[game][category]

      false
    end
  end
end
