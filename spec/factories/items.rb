FactoryBot.define do
  factory :item do
    association :user

    name            { Faker::Commerce.product_name }
    details         { Faker::Lorem.sentence }
    category_id     { 1 }
    condition_id    { 1 }
    delivery_fee_id { 1 }
    prefecture_id   { 1 }
    days_id         { 1 }
    price           { "9999" }
    
  end
end
