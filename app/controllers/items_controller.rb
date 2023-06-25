class ItemsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    items = Item.all
    render json: items, include: :user
  end
def show
  item = Item.find(params[:id])
  render json: item
end

def user_items
  user = User.find(params[:user_id])
  items = user.items
  render json: items
end
private

def render_not_found_response
  render json: {error: "Item not found"}, status: :not_found
end
end
