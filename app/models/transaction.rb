# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true
end
