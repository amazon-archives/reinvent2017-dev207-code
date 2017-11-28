class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # ListItems - GET /items
  def index
    opts = {}
    opts[:next_token] = params["NextToken"] if params["NextToken"]
    opts[:limit] = params["Limit"].to_i if params["Limit"]
    resp = Item.list_page(opts)
    render json: resp
  end

  # GetItem - GET /items/:id
  def show
    render json: { item: @item.to_h }
  end

  # CreateItem - POST /items
  def create
    @item = Item.create_item(item_params)
    if @item.save
      render json: { item: @item.to_h }
    else
      render json: {
        error: @item.errors
      }, status: :unprocessable_entity
    end
  end

  # UpdateItem - PATCH/PUT /items/:id
  def update
    @item.update_item(item_params)
    if @item.save
      render json: { item: @item.to_h }
    else
      render json: {
        error: @item.errors
      }, status: :unprocessable_entity
    end
  end

  # DeleteItem - DELETE /items/:id
  def destroy
    @item.delete!
    render json: { success: true }
  end

  private
  def set_item
    @item = Item.find(uuid: params[:id])
    if @item
      @item
    else
      render json: {
        code: "ItemDoesNotExistException",
        message: "Item #{params[:id]} does not exist.",
        retriable: false
      }, status: 404
    end
  end

  def item_params
    permitted = params.require(:item).permit(:body)
  end
end
