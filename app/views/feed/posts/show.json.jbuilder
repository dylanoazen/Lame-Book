    json.extract! @post, :id, :user, :post, :created_at
    json.url post_url(@post, format: :json)
    json.likes @post.likes[0].like_count