class ActionItemsController < ApplicationController
  def new
    @action_item = ActionItem.new
  end

  def index
    @action_items = ActionItem.all
  end

  def create
    ActionItem.create params.require(:action_item).permit(:action)
    redirect_to root_path
  end
end
