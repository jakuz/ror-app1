class User < ApplicationRecord
    has_many :posts
    has_many :comments

    validates :name, presence: true
    validates :name, format: { with: /\A[Aa-zA-Z]+\z/ }
    scope :created_today, -> { where("created_at > ?", Date.today.beginning_of_day) }
    scope :with_name, -> (name) { where("name LIKE ?", "#{name}%") }
end
