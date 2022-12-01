require 'rails_helper'

RSpec.describe Artist do
  describe 'relationship' do
    # shoulda-matcher gem test
    it { should have_many :songs }
  end

  describe 'instance methods' do
    before :each do
      @prince = Artist.create!(name: "Prince")
      @purple = @prince.songs.create!(title: "Purple Rain", length: 845, play_count: 92342)
      @beret = @prince.songs.create!(title: "Raspberry Beret", length: 664, play_count: 2382)
      @prince.songs.create!(title: "Little Red Corvette", length: 1, play_count: 220)
    end

    describe '#average_song_length' do
      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(503.33)
      end
    end
  end
end