require "test_helper"

class OperationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get operations_index_url
    assert_response :success
  end

  test "should get show" do
    get operations_show_url
    assert_response :success
  end
end
