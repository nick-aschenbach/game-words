require 'spec_helper'

describe GameWords::Generator do
  describe 'WORDS_PATH' do
    it 'defines a root path for the game words' do
      expect { GameWords::WORDS_PATH }.not_to raise_error
    end
  end

  describe '.new' do
    subject { GameWords::Generator.new }

    it 'loads the words YAML file' do
      expect(YAML).to receive(:load_file).with(GameWords::WORDS_PATH)

      subject
    end
  end

  describe '#games' do
    subject { GameWords::Generator.new.games }

    it 'lists the available games' do
      expect(subject).to match_array(['catchphrase',
                                      'holidays',
                                      'pictionary',
                                      'charades'])
    end
  end

  describe '#game_categories' do
    subject { GameWords::Generator.new.game_categories(game) }

    context 'catchphrase' do
      let(:game) { 'catchphrase' }

      it 'lists catchphrase categories' do
        expect(subject).to match_array(['easy',
                                        'medium',
                                        'hard',
                                        'animals',
                                        'food',
                                        'travel',
                                        'people',
                                        'household'])
      end
    end
    context 'holidays' do
      let(:game) { 'holidays' }

      it 'lists the holiday categories' do
        expect(subject).to match_array(['halloween',
                                        'christmas',
                                        'independence',
                                        'thanksgiving',
                                        'christmassong',
                                        'valentinesaying',
                                        'valentinesong',
                                        'valentineword',
                                        'newyears',
                                        'spring'])
      end
    end
    context 'pictionary' do
      let(:game) { 'pictionary' }

      it 'lists the pictionary categories' do
        expect(subject).to match_array(['easy',
                                        'medium',
                                        'difficult',
                                        'hard',
                                        'idioms',
                                        'characters',
                                        'movies'])
      end
    end
    context 'charades' do
      let(:game) { 'charades' }

      it 'lists the charades categories' do
        expect(subject).to match_array(['easy',
                                        'medium',
                                        'difficult',
                                        'hard',
                                        'actions'])
      end
    end
    context 'undefined game category' do
      let(:game) { 'foosball' }

      it 'returns an empty array' do
        expect(subject).to match_array([])
      end
    end
  end

  describe '#words' do
    subject { GameWords::Generator.new.words(game, category) }

    let(:words) {
      {
        'game1' => {
          'cat1' => %w[word1 word2],
          'cat2' => %w[word3]
        },
        'game2' => {
          'cat3' => %w[word4]
        }
      }
    }

    before do
      allow(YAML).to receive(:load_file).and_return(words)
    end

    context 'when the category is specified' do
      let(:game) { 'game2' }

      context 'when the category exists' do
        let(:category) { 'cat3' }

        it 'only shows the words for that category' do
          expect(subject).to match_array(%w[word4])
        end
      end

      context 'when the category does not exist' do
        let(:category) { 'blah' }

        it 'returns an empty array' do
          expect(subject).to eq([])
        end
      end
    end

    context 'when the category is not specified' do
      let(:game) { 'game1' }
      let(:category) { nil }

      it 'shows all of the words for all categories for that game' do
        expect(subject).to match_array(%w[word1 word2 word3])
      end
    end

    context 'unhappy paths' do
      context 'when the game does not exist' do
        let(:game) { 'foo' }
        let(:category) { 'cat1' }

        it 'returns an empty array' do
          expect(subject).to eq([])
        end
      end

      context 'when the game exists' do
        let(:game) { 'game1' }

        context 'but the category does not exist' do
          let(:category) { 'bar' }
          it 'returns an empty array' do
            expect(subject).to eq([])
          end
        end
      end
    end
  end
end