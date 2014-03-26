class CreateActionItem < ActiveRecord::Migration
  def change
    create_table :action_items do |t|
      t.string :action
    end
  end
end
