class FavoritesController < ApplicationController
  def create
    user=current_account
    boardorder=BoardOrder.find(params[:board_order_id])
    if Favorite.create(board_user_id: user.id,board_order_id:boardorder.id)
    redirect_to boardorder
    else
      redirect_to root_url
    end
  end

  def destroy
    user=current_account
    boardorder=BoardOrder.find(params[:board_order_id])
    if favorite=Favorite.find_by(board_user_id: user.id,board_order_id:boardorder.id)
      favorite.delete
      redirect_to boardorder#board_users_path(current_account)
    else
      redirect_to root_url
    end
  end

end
