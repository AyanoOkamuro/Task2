class Book < ApplicationRecord
  validates :title, {presence: true} #titleが存在しないといけない
  validates :body, {presence: true} #bodyが存在しないと
end
