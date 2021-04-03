require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_inclusion_of(:status).in_array %w[backlog inprogress done] }
  end
end
