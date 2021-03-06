require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # https://qiita.com/taka_no_okapi/items/0aa1be3624b337fa5db9を参照
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it 'image、name、details、category_id、condition_id、delivery_fee_id、prefecture_id、days_id、price、user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailsが空だと登録できない' do
        @item.details = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it 'category_idの値が0だと登録できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'condition_idの値が0だと登録できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it 'delivery_fee_idの値が0だと登録できない' do
        @item.delivery_fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
      end
      it 'prefecture_idの値が0だと登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'days_idの値が0だと登録できない' do
        @item.days_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 0')
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceの範囲が、¥300~¥9,999,999の間でないと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceの範囲が、¥300~¥9,999,999の間でないと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceに半角数字が含まれていなければ登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceに半角数字が含まれていなければ登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
