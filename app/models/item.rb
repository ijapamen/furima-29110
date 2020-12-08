class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee,

  # with_options presence: true do
  #   validates :name
  #   validates :details

  #   with_options numericality: { other_than: 0 } do
  #     validates :category_id
  #     validates :condition_id
  #     validates :delivery_fee_id
  #     validates :prefecture_id
  #     validates :days_id
  #   end

  #   validates :user
  # end  

end
