require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:john_doe)
  end

  test "should get index" do
    get members_url, as: :json
    assert_response :success
  end

  test "should create member" do
    assert_difference("Member.count") do
      post members_url, params: {
        name: "John Doe",
        email: "email@email.com"
      }, as: :json
    end

    assert_response :created
  end

  test 'should not create invalid member' do
    assert_no_difference("Member.count") do
      post members_url, params: { member: {
        name: "John Doe",
        email: ""
      } }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test "should show member" do
    get member_url(@member), as: :json
    assert_response :success
  end

  test "should not show invalid member" do
    get member_url(999), as: :json

    assert_response :unprocessable_entity
    assert_equal "Member not found", JSON.parse(@response.body)["error"]
  end

  test "should update member" do
    patch member_url(@member), params: {
      name: "Other name",
      email: "other_email@other_email.com"
    }, as: :json
    assert_response :success
  end

  test "should destroy member" do
    assert_difference("Member.count", -1) do
      delete member_url(@member), as: :json
    end

    assert_response :no_content
  end
end
