class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
      if item.valid?
        redirect_to item_path
      else
        render :edit
      end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :details, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
