class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :day

  with_options presence: true do
    validates :image
    validates :name
    validates :details

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :days_id
    end

    validates_inclusion_of :price, in:300..9999999
    validates :user
  end  

end
