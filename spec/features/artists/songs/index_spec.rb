# as a user
# when I visit an artists songs index
# then I see the titles of all that artists songs
# and i see that each title is a link to the songs show page

require 'rails_helper'

RSpec.describe 'artists songs index' do
  before :each do
    @prince = Artist.create!(name: "Prince")
    @purple = @prince.songs.create!(title: "Purple Rain", length: 834, play_count: 92342)
    @beret = @prince.songs.create!(title: "Raspberry Beret", length: 234, play_count: 2382)
  end

  describe 'as a user' do
    describe 'when I visit artists songs index' do
      it 'shows all titles of that artists songs' do
        
        visit "/artists/#{@prince.id}/songs"

        expect(page).to have_content(@purple.title)
        expect(page).to have_content(@beret.title)
      end

      it 'shows each title as a link to songs show page' do
        visit "/artists/#{@prince.id}/songs"

        click_on @purple.title

        expect(current_path).to eq("/songs/#{@purple.id}")
      end

      it 'shows average song length for artist' do
        visit "/artists/#{@prince.id}/songs"

        expect(page).to have_content("Average Song Length for Prince: 534.0")
      end
    end
  end
end