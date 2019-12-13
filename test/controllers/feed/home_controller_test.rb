require 'test_helper'

class Feed::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feed_home_index_url
    assert_response :success
  end

end
