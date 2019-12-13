require 'test_helper'

class Feed::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feed_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get feed_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get feed_posts_create_url
    assert_response :success
  end

end
