require 'rails_helper'

RSpec.describe Wine, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:wine_type) }
    it { should validate_presence_of(:rating) }
  end
end
