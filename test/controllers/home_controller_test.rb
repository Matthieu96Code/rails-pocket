require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get categories" do
    get home_categories_url
    assert_response :success
  end
end
