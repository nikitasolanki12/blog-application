class Blog < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :publication_date, presence: true
end
