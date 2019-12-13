require 'test_helper'

class Hub::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hub_login_index_url
    assert_response :success
  end

end
