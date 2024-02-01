require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
   test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'test', email: 'test@example.com', password: 'password123' } }
    end

    assert_response :created
  end

  test "should not create user with invalid data" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: 'test', email: 'invalid_email', password: 'password123' } }
    end

    assert_response :unprocessable_entity
  end

  test "should show user" do
    user = users(:one) 
    get user_url(user)
    assert_response :success
  end

  test "should update user" do
    user = users(:one)
    patch user_url(user), params: { user: { email: 'newemail@example.com' } }
    assert_response :success
    assert_equal 'newemail@example.com', user.reload.email
  end

  test "should destroy user" do
    user = users(:one)
    assert_difference('User.count', -1) do
      delete user_url(user)
    end

    assert_response :no_content
  end
end
