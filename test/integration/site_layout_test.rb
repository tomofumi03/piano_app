require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", "https://fr-fr.facebook.com/city.komaki/posts/1215975871778439/"
    assert_select "a[href=?]", "https://hibiclassic.com/news/"
    get contact_path
    assert_select "title", "Contact | Piano app"
    get signup_path
    assert_response :success
  end

  def setup
    @user = users(:michael)
  end

  test "layout links when logged in" do
    log_in_as(@user, remember_me: '1')
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", "https://fr-fr.facebook.com/city.komaki/posts/1215975871778439/"
    assert_select "a[href=?]", "https://hibiclassic.com/news/"
    get contact_path
    assert_select "title", "Contact | Piano app"
    get signup_path
    assert_response :success
    assert_match @user.active_relationships.count.to_s, response.body
    assert_match @user.passive_relationships.count.to_s, response.body
  end
end
