class AddOwnerToActionItem < ActiveRecord::Migration
  def change
    add_column :action_items, :owner, :string
  end
end
