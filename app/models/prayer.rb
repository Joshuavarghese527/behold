class Prayer < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {maximum: 5000}
end
