require 'rails_helper'

RSpec.describe Song do
  describe "relationships" do
    it { should belong_to :artist }
  end
end