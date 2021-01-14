require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
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
end
