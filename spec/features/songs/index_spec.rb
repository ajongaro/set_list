require 'rails_helper'

RSpec.describe 'songs index page', type: :feature do
  # As a user,
  # when I visit '/songs'
  # I see each song's title and play count

  describe "as a user" do
    describe "when I visit /songs" do
      it "I see each songs title and play count" do
        artist = Artist.create!(name: "Carly Rae Jepson")
        song = Song.create!(title: "I Really Like You", length: 208, play_count: 2342342, artist: artist)
        song_2 = Song.create!(title: "Call Me Maybe", length: 203, play_count: 23423, artist: artist)
        
        visit "/songs"
        expect(page).to have_content(song.title)
        expect(page).to have_content("Play count: #{song.play_count}")
        expect(page).to have_content("Play count: #{song_2.play_count}")
      end
    end
  end
end