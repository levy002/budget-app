require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'levy', email: 'levy@test.com', password: '123456') }

  before { subject.save }

  it 'subject should be valid' do
    expect(subject).to be_valid
  end

  describe 'check for validations' do
    it 'not valid without name' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'have correct name' do
      subject.name = 'levy'
      expect(subject).to be_valid
    end

    it 'is not valid without password' do
      subject.password = 'ettescents'
      expect(subject).to be_valid
    end
  end
end
