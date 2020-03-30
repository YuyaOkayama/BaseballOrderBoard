require 'test_helper'

class BoardOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_order = board_orders(:one)
  end

  test "should get index" do
    get board_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_board_order_url
    assert_response :success
  end

  test "should create board_order" do
    assert_difference('BoardOrder.count') do
      post board_orders_url, params: { board_order: { boarduser_id: @board_order.boarduser_id, image: @board_order.image, message: @board_order.message } }
    end

    assert_redirected_to board_order_url(BoardOrder.last)
  end

  test "should show board_order" do
    get board_order_url(@board_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_order_url(@board_order)
    assert_response :success
  end

  test "should update board_order" do
    patch board_order_url(@board_order), params: { board_order: { boarduser_id: @board_order.boarduser_id, image: @board_order.image, message: @board_order.message } }
    assert_redirected_to board_order_url(@board_order)
  end

  test "should destroy board_order" do
    assert_difference('BoardOrder.count', -1) do
      delete board_order_url(@board_order)
    end

    assert_redirected_to board_orders_url
  end
end
