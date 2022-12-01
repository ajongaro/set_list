require 'rails_helper'

RSpec.describe Artist do
  describe 'relationship' do
    it { should have_many :songs }
  end
end