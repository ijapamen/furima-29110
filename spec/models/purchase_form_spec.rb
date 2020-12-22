require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '「購入記録」と「住所(発送先)」の保存' do
    context '保存がうまくいくとき' do
      it 'item_id, user_id, postal_code, prefecture_id, city, house_number, phone_number, tokenが存在すれば保存できる' do
        expect(@purchase_form).to be_valid
      end
      it 'building_nameが存在しなくても保存できる' do
        expect(@purchase_form).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'item_idが空だと保存できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できない' do
        @purchase_form.prefecture_id = '0'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @purchase_form.house_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角のハイフンを含むと保存できない' do
        @purchase_form.phone_number = '080-1234-5678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以内でないと保存できない' do
        @purchase_form.phone_number = '080123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
