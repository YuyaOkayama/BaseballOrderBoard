class BoardOrdersController < ApplicationController
  before_action :set_board_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  protect_from_forgery
  # layout 'board_orders'

  # GET /board_orders
  # GET /board_orders.json
  def index
    @board_orders = BoardOrder.page(params[:page]).order('created_at desc')
    users = BoardUser.where 'account_id = ?', current_account.id
    if users[0] == nil then
      user = BoardUser.new
      user.account_id = current_account.id
      user.nickname = '<<no name>>'
      user.save
      users = BoardUser.where 'account_id = ?', current_account.id
    end
    @board_user = users[0]
    @board_order = BoardOrder.new
    @board_order.boarduser_id = @board_user.id
  end

  # GET /board_orders/1
  # GET /board_orders/1.json
  def show
    redirect_to '/board_orders'
  end

  # GET /board_orders/new
  def new
    redirect_to '/board_orders'
  end

  # GET /board_orders/1/edit
  def edit
    redirect_to '/board_orders'
  end

  # POST /board_orders
  # POST /board_orders.json
  def create
    @board_orders = BoardOrder.page(params[:page]).order('created_at desc')
    @board_order = BoardOrder.new(board_order_params)
    @board_order.image = params['board_order']['image']
    @board_user = BoardUser.where('account_id == ?',current_account.id)[0]

    respond_to do |format|
      if @board_order.save
        format.html { redirect_to '/board_orders'}
        format.json { render :show, status: :created, location: @board_order }
      else
        format.html { render :index }
        format.json { render json: @board_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_orders/1
  # PATCH/PUT /board_orders/1.json
  def update
    redirect_to '/board_orders'
  end

  # DELETE /board_orders/1
  # DELETE /board_orders/1.json
  def destroy
    redirect_to '/board_orders'
  end

  def send_image
    @board_order = BoardOrder.find(params[:id])
    send_data(Base64.decode64(@board_order.image), :disposition => "inline", :type => "image/png")
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_board_order
    @board_order = BoardOrder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_order_params
    params.require(:board_order).permit(:message, :boarduser_id, :image)
  end
end

