FactoryBot.define do
  factory :purchase_form do
    item_id { 1 }
    user_id { 1 }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '大阪市' }
    house_number { '1-1' }
    phone_number { '08012345678' }
    building_name { '' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
