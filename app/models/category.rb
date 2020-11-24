class Category < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks
  has_many :groups, through: :tasks 
end
