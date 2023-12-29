require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_one)
  end

  test "should get index" do
    get posts_url, as: :json
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: {
        post: {
          title: "My new post",
          body: "This is the body of my new post",
          member_id: members(:john_doe).id
        }
      }, as: :json
    end

    assert_response :created
  end

  test "should not create post without an owner" do
    assert_no_difference("Post.count") do
      post posts_url, params: {
        post: {
          title: "My new post",
          body: "This is the body of my new post"
        }
      }, as: :json
    end

    assert_response :unprocessable_entity
    assert_equal response.body, "{\"member\":[\"must exist\"]}"
  end

  test "should show post" do
    get post_url(@post), as: :json
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: {
      title: "My updated post",
    } }, as: :json
    assert_response :success
  end

  test "should not update post without an owner" do
    patch post_url(@post), params: { post: {
      member_id: nil
    } }, as: :json
    assert_response :unprocessable_entity
    assert_equal response.body, "{\"member\":[\"must exist\"]}"
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post), as: :json
    end

    assert_response :no_content
  end
end
