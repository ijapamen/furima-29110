require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
      end
      it "emailに@が含まれていれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordに半角英数字が含まれていれば登録できる" do
      end
      it "last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる" do
      end
      it "last_name_kanaとfirst_name_kanaが全角（カタカナ）で入力されていれば登録できる" do
      end

    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailが存在する場合は登録できない" do
      end
      it "emailに@が含まれていなければ登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordに半角英数字が含まれていなければ登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）で入力されていれなければ登録できない" do
      end
      it "last_name_kanaとfirst_name_kanaが全角（カタカナ）で入力されていなければ登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end

    end
  end
end