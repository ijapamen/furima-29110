class PurchaseForm
  include ActiveModel::Model

  attr_accessor :item, :user, :postal_code, :prefecture, :city, :address, :building, :phone_number, :purchase_record
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item
    validates :user
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :building
    validates :phone_number
    validates :purchase_record
  end


  def save
    # 各テーブルにデータを保存する処理を書く
    モデル名.create(item: item, user: user)    
    モデル名.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_record: purchase_record)    
  end
end