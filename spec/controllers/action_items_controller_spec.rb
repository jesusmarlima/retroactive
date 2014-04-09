require 'spec_helper'

describe ActionItemsController do

  describe "#edit" do
    it "assigns the action item to edit" do
      allow(ActionItem).to receive(:find){ double(:action_item) }
      get :edit, id: 1
      expect(assigns(:action_item)).to_not be_nil
    end
  end

  describe "#update" do
    context "successfully" do
      it "updates the action item" do
        allow(ActionItem).to receive(:find){ double(:action_item, update_attributes: true ) }
        put :update, id: 1, action_item: { id: 1, action: 'Some Action', owner: 'Someone'}
      end
    end
  end
end

