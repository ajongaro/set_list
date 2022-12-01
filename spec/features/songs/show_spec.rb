require 'rails_helper'

RSpec.describe 'the songs show page', type: :feature do
  # As a visitor
  # When I visit /songs/1 (where 1 is the id of a song in my db)
  # Then I see that song's title, and artist
  # And I do not see any of the other songs in my db

  describe 'as a user' do
    describe 'when I go to song/song.id page' do
      it 'displays the song title' do 
        artist = Artist.create!(name: "Carly Rae Jepsen")
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2342342)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 203, play_count: 23423)
        visit "/songs/#{song.id}"
        
        expect(page).to have_content(song.title)
        expect(page).to_not have_content(song_2.title)
      end

      it 'displays the name of the artist for the song' do
        artist = Artist.create!(name: "Carly Rae Jepsen")
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2342342)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 203, play_count: 23423)

        visit "/songs/#{song.id}"
        # save_and_open_page
        expect(page).to have_content(artist.name)
      end
    end
    # When I visit a Song show page
    # Then I see the song's title, length, and play count
    describe 'when I visit a songs show page' do
      it 'shows the title, length, and play count' do
        artist = Artist.create!(name: "Carly Rae Jepsen")
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2342342)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 203, play_count: 23423)

        visit "/songs/#{song.id}"
        save_and_open_page

        expect(page).to have_content(song.title)
        expect(page).to have_content(song.length)
        expect(page).to have_content(song.play_count)
      end

      # I see a link back to the songs index page
      # When I click this link
      # Then I am taken to the songs index 
      it 'shows a link back to songs index page' do
        artist = Artist.create!(name: "Carly Rae Jepsen")
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2342342)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 203, play_count: 23423)

        visit "/songs/#{song.id}"
        expect(page).to have_link("Songs Index")
      end

      it 'songs index link returns to songs index when clicked' do
        artist = Artist.create!(name: "Carly Rae Jepsen")
        song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2342342)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 203, play_count: 23423)

        visit "/songs/#{song.id}"
        click_link "Songs Index"
        expect(page).to have_content("Songs Index")
      end
    end

    # When I visit an Artist's show page
    # Then I see the Artist's name
    # And I see the Artist's average song lenth
    # And I see the Artist's total song count
    describe 'When I visit an artists show page' do
      it 'shows artists name, average song length, total song count'

      end
    end
  end
end