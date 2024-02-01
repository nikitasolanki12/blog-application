require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
    @blog = blogs(:one)
  end

  test "should get index" do
    sign_in @user
    get blogs_url
    assert_response :success
    assert_not_nil assigns(:blogs)
  end

  test "should get show" do
    get blog_url(@blog)
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_blog_url
    assert_response :success
    assert_not_nil assigns(:blog)
  end

  test "should create blog" do
    sign_in @user
    assert_difference('Blog.count') do
      post blogs_url, params: { blog: { title: 'my Blog', content: 'my first blog', publication_date: Date.today } }
    end

    assert_redirected_to blog_url(Blog.last)
  end

  test "should not create blog with invalid data" do
    sign_in @user
    assert_no_difference('Blog.count') do
      post blogs_url, params: { blog: { title: '', content: 'my blogs', publication_date: Date.today } }
    end

    assert_template :new
  end

  test "should get edit" do
    sign_in @user
    get edit_blog_url(@blog)
    assert_response :success
    assert_not_nil assigns(:blog)
  end

  test "should update blog" do
    sign_in @user
    patch blog_url(@blog), params: { blog: { title: 'Updated Blog' } }
    assert_redirected_to blogs_url
    @blog.reload
    assert_equal 'Updated Blog', @blog.title
  end

  test "should not update blog with invalid data" do
    sign_in @user
    patch blog_url(@blog), params: { blog: { title: '' } }
    assert_template :edit
  end

  test "should destroy blog" do
    sign_in @user
    assert_difference('Blog.count', -1) do
      delete blog_url(@blog)
    end

    assert_redirected_to blogs_url
  end
end
