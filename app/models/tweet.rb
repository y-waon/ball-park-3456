class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :category_id
    validates :status_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :status
end
