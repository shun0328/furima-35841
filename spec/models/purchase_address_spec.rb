require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: @item.id, user_id: @user.id)
    sleep 1
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての情報が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名は任意であるため空でも購入ができる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号が空では購入きない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it '郵便番号が3桁-(ハイフン)4桁の半角文字列でないと購入できない' do
        @purchase_address.postal_code = '150-000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号にハイフンが入っていないと購入できない' do
        @purchase_address.postal_code = '1500000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が全角では購入できない' do
        @purchase_address.postal_code = '１５０-００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空では登録できない' do
        @purchase_address.delivery_source_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Delivery source must be other than 1")
      end
      it '市区町村が空では購入できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下の場合購入できない' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上の場合購入できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号にハイフンが入っている場合購入できない' do
        @purchase_address.phone_number = '090-123-456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
