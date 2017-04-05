require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get withdraw" do
    get transaction_withdraw_url
    assert_response :success
  end

  test "should get deposit" do
    get transaction_deposit_url
    assert_response :success
  end

end
