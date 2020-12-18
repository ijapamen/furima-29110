class PurchaseForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :order_id
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :order_id
  end
  validates :building_name

  def save
    # 各テーブルにデータを保存する処理を書く
    モデル名.create(item: item, user: user)    
    モデル名.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_record: purchase_record)    
  end
end