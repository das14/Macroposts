require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "test@invalid",
                                         password: "123",
                                         password_confirmation: "test"
                                       }
                               }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post user_path, paramas: {uesr: {name: "Test User",
                                       email: "test@example.com",
                                       password: "123456",
                                       password_confirmation: "123456"
                                      }
                               }
    end
    follor_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
  end

end
