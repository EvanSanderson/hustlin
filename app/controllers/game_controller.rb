class GameController < ApplicationController
  before_action :authenticate_user!
  def homebase
    @user = current_user
    @eligible_quests = current_user.get_eligible_quests
    @current_quests = current_user.player_quests.map{|player_quest| player_quest.quest}
    @stores = current_user.get_accessible_stores
    @player_items = current_user.react_player_items
    @homebase_props = {
      user: @user,
      eligible_quests: @eligible_quests,
      current_quests: @current_quests,
      player_items: @player_items
    }
  end

  def store
    @player_items = current_user.react_player_items
    # TODO: obviously can't do Store.first, make multiple stores going forward, open up as you progress in the game
    @store = Store.find(params[:id])
    @store_items = @store.react_store_items
    @store_props = {
      id: @store.id,
      name: @store.name,
      user: current_user,
      player_items: @player_items,
      store_items: @store_items
    }
  end
end
