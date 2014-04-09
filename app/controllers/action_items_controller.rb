class ActionItemsController < ApplicationController
  def new
    @action_item = ActionItem.new
  end

  def index
    @action_items = ActionItem.all
  end

  def edit
    @action_item = ActionItem.find params[:id]
  end

  def update
    action_item = ActionItem.find params[:id]
    action_item.update_attributes action_item_params
    redirect_to action: :index
  end

  def create
    ActionItem.create params.require(:action_item).permit(:action)
    redirect_to root_path
  end

  private

  def action_item_params
     params.require(:action_item).permit(:action, :owner)
  end
end
