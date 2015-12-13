require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_select 'div#error_explanation > ul > li:nth-child(1)', "Name can't be blank"
    assert_select 'div#error_explanation > ul > li:nth-child(2)', "Email is invalid"
    assert_select 'div#error_explanation > ul > li:nth-child(3)', "Password confirmation doesn't match Password"
    assert_select 'div#error_explanation > ul > li:nth-child(4)',
                  "Password confirmation is too short (minimum is 6 characters)"
    assert_select 'div#error_explanation > ul > li:nth-child(5)', "Password is too short (minimum is 6 characters)"

  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Example User",
                                            email: "user@example.com",
                                            password: "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert_not flash.nil?
    flashassertion = false
    flash.each do |messagetype, message|
       flashassertion = true if messagetype == "success" && message == "Welcome to the Sample App!"
    end
    assert flashassertion

  end

end