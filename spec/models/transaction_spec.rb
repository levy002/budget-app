# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    user = User.create(name: 'Levy', email: 'levy@test.come', password: '123456')
    category = Category.create(user:, name: 'transport', icon: 't_icon')
    Transaction.new(user:, category:, name: 'January', amount: 30)
  end

  before { subject.save }

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  describe 'validations' do
    it 'not valid without name' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'valid if amount isnt greater than zero' do
      subject.amount = 0
      expect(subject).to be_valid
    end

    it 'the amount to be an integer' do
      expect(subject.amount).to be_integer
    end
  end
end
