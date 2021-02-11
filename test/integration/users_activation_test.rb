require 'test_helper'

class UsersActivationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @unactivated_user = users(:red)
  end

  test "index_only_activated user" do
    log_in_as @user
    get users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", user_path(@unactivated_user), count: 0
    
  end

  test "show_only_activated user" do
    log_in_as @user
    get user_path(@user)
    get user_path(@unactivated_user)
    assert_redirected_to root_url

  end
end
