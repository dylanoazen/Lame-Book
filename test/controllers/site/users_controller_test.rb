require 'test_helper'

class Site::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_users_index_url
    assert_response :success
  end

end
